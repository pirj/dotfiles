local wibox     = require("wibox")
local awful     = require("awful")
local beautiful = require("beautiful")
local util      = require("pomodoro/util")
local os        = os
local timer     = timer
local setmetatable = setmetatable
local table     = table
local ipairs    = ipairs

module("pomodoro")

local pomodoro = {}

-- Internal state
local current_pomodoro = 0
local state = "free_time"
local initial_time = os.time()

-- Tweakable configuration {{{
-- Durations in seconds
pomodoro.durations = { work = 25 * 60, short_break = 5 * 60, long_break = 20 * 60, away = 60 * 60, treshold = 2 * 60 }

-- Titles
pomodoro.titles = {
  started = { title = "Pomodoro started", subtitle = "Stay focused" },
  done = { title = "Pomodoro done", subtitle = "Time for a short break" },
  set_done = { title = "Set done", subtitle = "Time for a long break" },
  squashed = { title = "Pomodoro squashed", subtitle = "Yuck!" },
  short_break_exceeded = { title = "Short break exeeded", subtitle = "" },
  short_break_unfulfilled = { title = "Short break unfulfilled", subtitle = "You need to rest between working periods" },
  long_break_exceeded = { title = "Long break exceeded", subtitle = "" },
  long_break_unfulfilled = { title = "Long break unfulfilled", subtitle = "You need to rest between working periods" },
  free_time = { title = "Enjoy your free time", subtitle = "Forget about work" }
}

pomodoro.notification_timeout = 10

-- Prefixes
pomodoro.prefixes = { work = "In progress", short_break = "Short break", long_break = "Long break", away = "Away", free_time = "Free time" }

-- Widget contents format
pomodoro.format = function (time, state, current_pomodoro)
  local icon = pomodoro.prefixes[state]
  return current_pomodoro .. " " .. icon .. " " .. time
end
-- }}}

-- Widget
pomodoro.widget = wibox.widget.textbox()

-- Time representation handlers
local countdown = function(now, initial) return pomodoro.durations.work - (now - initial) end
local regular = function(now, initial) return now - initial end
local time_representations = { work = countdown, short_break = regular, long_break = regular, away = regular, free_time = regular }

local listeners = { started = {}, done = {}, set_done = {}, squashed = {}, short_break_exceeded = {}, long_break_exceeded = {}, free_time = {}, all = {} }

pomodoro.on = function(event, fn) table.insert(listeners[event], fn) end

local emit = function(event)
  for _, listener in ipairs(listeners[event]) do listener() end
  for _, listener in ipairs(listeners["all"]) do listener(event) end
end

-- Button click handlers
local clicked = {
  work = function() emit("squashed") end,
  short_break = function()
    local now = os.time()
    if (now - initial_time > pomodoro.durations.short_break) then
      emit("started")
    else
      util.notify(pomodoro.titles.short_break_unfulfilled)
    end
  end,
  long_break = function()
    local now = os.time()
    if (now - initial_time > pomodoro.durations.long_break) then
      emit("started")
    else
      util.notify(pomodoro.titles.long_break_unfulfilled)
    end
  end,
  away = function() emit("started") end,
  free_time = function() emit("started") end
}

pomodoro.widget:buttons(
  awful.button({ }, 1, function() clicked[state]() end)
)

-- Hooks
pomodoro.on("all", function(event)
  util.notify(pomodoro.titles[event])
end)

pomodoro.on("started", function()
  current_pomodoro = current_pomodoro + 1
  initial_time = os.time()
  state = "work"
end)

pomodoro.on("done", function()
  if current_pomodoro == 4 then
    emit("set_done")
  else
    initial_time = os.time()
    state = "short_break"
  end
end)

pomodoro.on("set_done", function()
  initial_time = os.time()
  current_pomodoro = 1
  state = "long_break"
end)

pomodoro.on("squashed", function()
  initial_time = os.time()
  state = "short_break"
end)

pomodoro.on("long_break_exceeded", function()
  state = "away"
end)

pomodoro.on("free_time", function()
  state = "free_time"
end)

-- Idle handlers
pomodoro.idle = function() idle_handlers[state]() end

idle_handlers = {
  work        = function() emit("squashed") end,
  short_break = function() end, long_break = function() end, away = function() end, free_time = function() end
}

-- Timeout handlers
local exceeds = function(limit, event) return function(now, initial) if (now - initial) > limit() then emit(event) end end end

timeout_handlers = {
  work        = exceeds(function() return pomodoro.durations.work end, "done"),
  short_break = exceeds(function() return pomodoro.durations.short_break + pomodoro.durations.treshold end, "short_break_exceeded"),
  long_break  = exceeds(function() return pomodoro.durations.long_break + pomodoro.durations.treshold end, "long_break_exceeded"),
  away        = exceeds(function() return pomodoro.durations.away + pomodoro.durations.treshold end, "free_time"),
  free_time   = function() end
}

-- Main tick handler
local tick = function()
  local now = os.time()
  timeout_handlers[state](now, initial_time)
  local time = time_representations[state](now, initial_time)
  pomodoro.widget:set_markup(pomodoro.format(util.format_time(time), state, current_pomodoro))
end

local timer = timer { timeout = 1 }
timer:connect_signal("timeout", function() tick() end)
timer:start()

return setmetatable(pomodoro, { __call = function(_, ...) return pomodoro end })
