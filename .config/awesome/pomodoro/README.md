Awesome WM Pomodoro widget
==========================
[Pomodoro Technique](http://pomodorotechnique.com) widget for the [Awesome WM](http://awesome.naquadah.org)

#### What is Pomodoro Technique?

It's simple, strict and straight-lined.

It helps focus on a task and avoid anxiety.

It consists of focusing on a task for 25 minutes and a short 5 minute break, this is called a Pomodoro.

After a set of 4 Pomodoros you should do a longer 20 minute break.

After some Pomodoros you should eat something. It's not necessary have to be a full set of 4 Pomodoros.

You should fully concentrate and try to avoid internal and external distractions.

If you got interrupted a Pomodoro it is squashed.

If you have some time left, do not switch to another task, reconsider what you have done and double check.

You should only use Pomodoro Technique when working, not during your free time.

##### Example

For example, your working day is 8:30-17:30.

Set 1, Pomodoro 1: work 8:30-8:55, short break 8:55-9:00

Set 1, Pomodoro 2: work 9:00-9:25, short break 9:25-9:30

Set 1, Pomodoro 3: work 9:30-9:55, short break 9:55-10:00

Set 1, Pomodoro 4: work 10:00-10:25, long break 10:25-10:45


Set 2, Pomodoro 1: work 10:45-11:10, short break 11:10-11:15

Set 2, Pomodoro 2: work 11:15-11:40, short break 11:40-11:45

Set 2, Pomodoro 3: work 11:45-12:10, short break 12:10-12:15

Set 2, Pomodoro 4: work 12:15-12:40


Lunch time begins 12:40

Back to work at 13:30


Set 3, Pomodoro 1: work 13:30-13:55, short break 13:55-14:00

Set 3, Pomodoro 2: work 14:00-14:25, short break 14:25-14:30

Set 3, Pomodoro 3: work 14:30-14:55, short break 14:55-15:00

Set 3, Pomodoro 4: work 15:00-15:25, long break 15:25-15:45


Set 4, Pomodoro 1: work 15:45-16:10, short break 16:10-16:15

Set 4, Pomodoro 2: work 16:15-16:40, short break 16:40-16:45

Set 4, Pomodoro 3: work 16:45-17:10, short break 17:10-17:15

Set 4, Pomodoro 4: work 17:15-17:40


Time to go home and enjoy the results of 16 25-minute periods of full concentration.

Rationale
---------
### There are at least two Pomodoro widgets:
1. [By François de Metz](https://github.com/francois2metz/pomodoro-awesome)
  - only handles working periods
  - only works with Awesome 3.4
2. [By Nikola Petrov, extracted from Nikolay Sturm(nistude)'s Awesome config](https://github.com/nikolavp/awesome-pomodoro)
  - tangled
  - too many tweaks over Pomodoro

How to use
----------
### Awesome installation

In your rc.lua:

    pomodoro = require("pomodoro")
    ...
    right_layout:add(pomodoro.widget)

### Tweaking

#### Duration
Some people may want to change default values for working period to, say, 35 minutes instead of default 25:

    pomodoro.durations.work = 35 * 60

The following durations are tweakable: `work`, `short_break`, `long_break`, `away`, `treshold`.
Threshold means that if you stayed at short break (5 minutes by default) longer by a threshold, it's counted as a long break. If you overstay at long break (20 minutes), you're on `away` (60 minutes), and if you're taking your lunch longer than that, state is being switched to `free_time`. Threshold is 5 minutes by default Threshold is 5 minutes by default.

#### Visualization
You may want to use nice [Font-Awesome](http://fortawesome.github.io/Font-Awesome/) and [Pomicons](https://github.com/gabrielelana/pomicons) to display icons.

    pomodoro.prefixes = { work = "<span color='darkred'></span>", short_break = "", long_break = "", away = "", free_time = "" }

#### Hooks

You may want to do something when state changes, e.g. lock screen:

    pomodoro.on('done', function() awful.util.spawn('slock') end)

The following hooks are valid: `started`, `done`, `set_done`, `squashed`, `short_break_exceeded`, `long_break_exceeded`, `free_time`.

#### Hotkey

By default, Mod4 + p is used. You can override that, e.g. Mod4+Shift+p:

    pomodoro.hotkey({ modkey, "Shift" }, "p")

#### Sets

By default each set consists of 4 Pomodoros, but you can tweak that:

    pomodoro.sets = {4, 3, 3, 4, 2}

#### Log

You can set up Pomodoro to write the results to a text file with tab separated format:

    21 Nov 2013\t08:30\tSet 1\tPomodoro 1\tDone
    21 Nov 2013\t09:00\tSet 1\tPomodoro 2\tSquashed

    pomodoro.log = "~/.pomodoro_log"

#### Activity tracking

You can call `pomodoro.idle()` in a hook and Pomodoro will be squashed if a working period is active:

    pomodoro.idle()

It's possible to achieve running [xsidle.sh](http://git.suckless.org/xssstate/commit/?id=c30b12c8e9d20225f69014d3fe60c0c0c4476773) from .xinitrc (with a small patch of $1 to $@ in xsidle.sh):

    xsidle.sh echo "pomodoro.idle()" | awesome-client &

#### Taskwarrior integration

    TODO: port to awesome 3.5 https://github.com/ValiValpas/awesome-taskwarrior

### Interaction

You're not urged to use Pomodoro, but when you do, you should follow the rules. Work for specific amount of time. Rest for specific amount of time. There's a minimum short and long breaks.
You are only able to click left mouse button (or use a hotkey) to squash Pomodoro when interrupted and start a new Pomodoro when rested.
In case Pomodoro detects inactivity during a working period, Pomodoro is squashed.

Plans
-----

    ! fix: short break should not automatically become long break; remove thresholds; (impossible to begin pomodoro when short break exceeds until long break exceeds)
    -only count non-squashed Pomodoros in set
    -hotkeys
    -Set formats {4, 3, 3, 4, 2}
    -Save timelapse to text file for later inspection
    Taskwarrior/todo.txt integration: focus on a specific task
    visualizer (d3js?)

License
-------
Copyright &copy; 2013 Phil Pirozhkov

Licensed under the [MIT License][MIT].

[MIT]: http://www.opensource.org/licenses/mit-license.php
