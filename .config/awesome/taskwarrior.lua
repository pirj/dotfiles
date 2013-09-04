---------------------------------------------------
-- Licensed under the GNU General Public License v2
--  * (c) 2012, Phil Pirozhkov <pirjsuka@gmail.com>
---------------------------------------------------

-- {{{ Grab environment
local tonumber = tonumber
local io = { popen = io.popen }
local setmetatable = setmetatable
local string = { gmatch = string.gmatch }
-- }}}

local taskwarrior = {}

-- {{{ Taskwarrior widget
local function worker(format, warg)
    local tasks  = {
        ["{Now}"] = "N/A",
        ["{Today}"]  = "N/A",
        ["{All}"]  = "N/A",
    }

    local f = io.popen("task list due.before:now | tail -n +4 | head -n -2 | wc -l")

    for line in f:lines() do
        tasks["{Now}"] = line
    end
    f:close()

    local f = io.popen("task list due.before:today | tail -n +4 | head -n -2 | wc -l")

    for line in f:lines() do
        tasks["{Today}"] = line
    end
    f:close()

    local f = io.popen("task list | tail -n +4 | head -n -2 | wc -l")

    for line in f:lines() do
        tasks["{All}"] = line
    end
    f:close()

    return tasks
end
-- }}}

return setmetatable(taskwarrior, { __call = function(_, ...) return worker(...) end })
