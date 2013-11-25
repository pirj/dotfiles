local wibox     = require("wibox")
local awful     = require("awful")
local beautiful = require("beautiful")
local util      = require("pomodoro/util")
local os        = os
local timer     = timer
local setmetatable = setmetatable

module("pomodoro")

local pomodoro = {}

-- Internal state
local current_pomodoro = 1
local state = "free_time"
local initial_time = os.time()

-- Tweakable configuration {{{
-- Durations in seconds
pomodoro.durations = { in_progress = 25 * 60, short_break = 5 * 60, long_break = 25 * 60, away = 90 * 60, treshold = 5 * 60 }

-- Titles
pomodoro.titles = {
  started = { title = "Pomodoro started", subtitle = "Stay focused" },
  done = { title = "Pomodoro done", subtitle = "Time for a short break" },
  set_done = { title = "Set done", subtitle = "Time for a long break" },
  squashed = { title = "Pomodoro squashed", subtitle = "Yuck!" },
  short_exceeded = { title = "Short break exeeded", subtitle = "" },
  long_exceeded = { title = "Long break exeeded", subtitle = "" },
  free_time = { title = "Enjoy your free time", subtitle = "Forget about work" }
}

pomodoro.notification_timeout = 10

-- Prefixes
pomodoro.prefixes = { in_progress = "In progress", short_break = "Short break", long_break = "Long break", away = "Away", free_time = "Free time" }

-- Widget contents format
pomodoro.format = function (time, state, current_pomodoro)
  local icon = pomodoro.prefixes[state]
  return current_pomodoro .. " " .. icon .. " " .. time
end
-- }}}

-- Transition handlers
local transitions = {}
transitions.started = function()
  util.notify(pomodoro.titles.started)
  initial_time = os.time()
  state = "in_progress"
end
transitions.done = function()
  if current_pomodoro == 4 then
    pomodoro.transitions.set_done()
  else
    initial_time = os.time()
    util.notify(pomodoro.titles.done)
    current_pomodoro = current_pomodoro + 1
    state = "short_break"
  end
end
transitions.set_done = function()
  util.notify(pomodoro.titles.set_done)
  initial_time = os.time()
  current_pomodoro = 1
  state = "long_break"
end
transitions.squashed = function()
  util.notify(pomodoro.titles.squashed)
  initial_time = os.time()
  state = "short_break"
end
transitions.short_break_exceeded = function()
  util.notify(pomodoro.titles.short_exceeded)
  state = "long_break"
end
transitions.long_break_exceeded = function()
  util.notify(pomodoro.titles.long_exceeded)
  state = "away"
end
transitions.free_time = function()
  util.notify(pomodoro.titles.free_time)
  state = "free_time"
end

-- Widget
pomodoro.widget = wibox.widget.textbox()

-- Time representation handlers
local time_representations = {}
time_representations.in_progress = function(now, initial) return pomodoro.durations.in_progress - (now - initial) end
time_representations.short_break = function(now, initial) return now - initial end
time_representations.long_break = function(now, initial) return now - initial end
time_representations.away = function(now, initial) return now - initial end
time_representations.free_time = function(now, initial) return now - initial end

-- Button click handlers
local clicked = {}
clicked.in_progress = transitions.squashed
clicked.short_break = transitions.started
clicked.long_break = transitions.started
clicked.away = transitions.started
clicked.free_time = transitions.started

mouse_clicked = function() clicked[state]() end

local buttons = function()
  return awful.util.table.join(
    awful.button({ }, 1, function()
      mouse_clicked()
    end),
    awful.button({ }, 3, function()
      transitions.free_time()
    end)
  )
end

-- Timeout handlers
timeout_handlers = {}
timeout_handlers.in_progress = function(now, initial) if (now - initial) > pomodoro.durations.in_progress then transitions.done() end end
timeout_handlers.short_break = function(now, initial) if (now - initial) > (pomodoro.durations.short_break + pomodoro.durations.treshold) then transitions.short_break_exceeded() end end
timeout_handlers.long_break = function(now, initial) if (now - initial) > (pomodoro.durations.long_break + pomodoro.durations.treshold) then transitions.long_break_exceeded() end end
timeout_handlers.away = function(now, initial) if (now - initial) > (pomodoro.durations.away + pomodoro.durations.treshold) then transitions.free_time() end end
timeout_handlers.free_time = function(now, initial) end

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

pomodoro.widget:buttons(buttons())

return setmetatable(pomodoro, { __call = function(_, ...) return pomodoro end })
