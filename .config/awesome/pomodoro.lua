-- Pomodoro widget for the awesome WM
--
-- https://github.com/francois2metz/pomodoro-awesome
--
-- Author: François de Metz
-- Modified to work with Awesome 3.5 by Phil Pirozhkov
--
-- Licensed under Do What The Fuck You Want To Public License:
-- http://en.wikipedia.org/wiki/WTFPL

local timer     = timer
local awful     = require("awful")
local naughty   = require("naughty")
local beautiful = require("beautiful")
local wibox     = require("wibox")
local setmetatable = setmetatable

-- 25 min
local pomodoro_time = 60 * 25

local image = beautiful.pomodoro_icon or awful.util.getdir("config") .. "/pomodoro.png"

-- setup widget
local pomodoro = wibox.widget.imagebox()
pomodoro:set_image(image)

-- setup timers
local pomodoro_timer = timer({ timeout = pomodoro_time })
local pomodoro_tooltip_timer = timer({ timeout = 1 })
local pomodoro_nbsec = 0

local function pomodoro_start()
  pomodoro_timer:start()
  pomodoro_tooltip_timer:start()
end

local function pomodoro_stop()
  pomodoro_timer:stop(pomodoro_timer)
  pomodoro_tooltip_timer:stop(pomodoro_tooltip_timer)
  pomodoro_nbsec = 0
end

local function pomodoro_end()
  pomodoro_stop()
  pomodoro.bg    = beautiful.bg_urgent
end

local function pomodoro_notify(text)
  naughty.notify({
    title = "Pomodoro",
    text = text,
    timeout = 1,
    icon = image,
    icon_size = 64,
    width = 200
  })
end

pomodoro_timer:connect_signal("timeout", function(c)
  pomodoro_end()
  pomodoro_notify('Ended')
end)

pomodoro_tooltip_timer:connect_signal("timeout", function(c)
  pomodoro_nbsec = pomodoro_nbsec + 1
end)

pomodoro_tooltip = awful.tooltip({
  objects = { pomodoro },
  timer_function = function()
    if pomodoro_timer.started then
      r = (pomodoro_time - pomodoro_nbsec) % 60
      return 'End in ' .. math.floor((pomodoro_time - pomodoro_nbsec) / 60) .. ' min ' .. r
    else
      return 'pomodoro not started'
    end
  end,
})

local function pomodoro_start_timer()
  if not pomodoro_timer.started then
    pomodoro_start()
    pomodoro_notify('Started')
  else
    pomodoro_stop()
    pomodoro_notify('Canceled')
  end
end

pomodoro:buttons(awful.util.table.join(
  awful.button({ }, 1, pomodoro_start_timer)
))

return setmetatable(pomodoro, { __call = function () return pomodoro end })
