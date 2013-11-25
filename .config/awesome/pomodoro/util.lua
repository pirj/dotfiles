local naughty   = require("naughty")
local os        = os

local util = {}

util.format_time = function(time)
  if time < 3600 then
    return os.date("%M:%S", time)
  else
    return os.date("!%X", time)
  end
end

util.notify = function(title)
  naughty.notify { title = title.title, text  = title.subtitle, timeout = pomodoro.notification_timeout }
end

return util
