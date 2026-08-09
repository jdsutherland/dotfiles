config = {}
local hyper = {"cmd", "alt", "ctrl", "shift"}

-- Enables the `hs` CLI to talk to this config (hs -c '...', hs -c 'hs.reload()').
require("hs.ipc")

local function mpvApplications()
  local apps = {}

  for _, app in ipairs(hs.application.runningApplications()) do
    if app:name() == "mpv" then
      table.insert(apps, app)
    end
  end

  table.sort(apps, function(a, b)
    return a:pid() < b:pid()
  end)

  return apps
end

local frontmost = hs.application.frontmostApplication()
local lastMpvPid = frontmost and frontmost:name() == "mpv" and frontmost:pid() or nil

config.mpvWatcher = hs.application.watcher.new(function(_, eventType, app)
  if eventType == hs.application.watcher.activated and app and app:name() == "mpv" then
    lastMpvPid = app:pid()
  end
end):start()

-- Per-display window geometry, remembered as unit rects so a frame saved on the
-- laptop still makes sense on the differently proportioned external.
local rememberedFrames = {}

local function focusedWindow(app)
  return app and (app:focusedWindow() or app:mainWindow() or app:allWindows()[1])
end

-- hs.timer objects stop themselves when garbage collected, so a bare doAfter is
-- a race against the collector. Hold a reference until it has fired.
local pendingTimers = {}

local function later(delay, fn)
  local timer
  timer = hs.timer.doAfter(delay, function()
    pendingTimers[timer] = nil
    fn()
  end)
  pendingTimers[timer] = true
end

local function isFillingScreen(window, screen)
  return window:frame() == screen:fullFrame()
end

local function rememberFrame(window, screen)
  local id = window:id()
  if not id then return end

  rememberedFrames[id] = rememberedFrames[id] or {}
  rememberedFrames[id][screen:id()] = screen:toUnitRect(window:frame())
end

-- Places the window where it last sat on this screen, filling the screen if we
-- have never seen it there. Doubles as the move itself for well-behaved apps.
local function applyFrame(window, screen)
  local id = window:id()
  local saved = id and rememberedFrames[id] and rememberedFrames[id][screen:id()]

  -- Duration 0: hs.window.animationDuration defaults to 0.2s of easing we don't want.
  window:setFrame(screen:fromUnitRect(saved or hs.geometry.unitrect(0, 0, 1, 1)), 0)
end

-- mpv refuses Accessibility moves onto a display with a negative origin (an
-- external placed above the built-in), while accepting them in the other
-- direction. Rather than guess at the rule, learn which screens reject the fast
-- path so we only ever pay for that discovery once.
local axRejects = {}

local function rejectsAX(screen)
  return axRejects[screen:id()]
end

local function noteAXRejected(screen)
  axRejects[screen:id()] = true
end

-- Rearranging displays invalidates what we learned.
config.screenWatcher = hs.screen.watcher.new(function() axRejects = {} end):start()

-- Fallback for when mpv won't take an Accessibility move: ask it to relocate
-- itself. move-screen.lua bounces it through fullscreen, because mpv only reads
-- the screen option at window creation.
local function moveMpvViaScript(app, screens, targetScreen, reframe)
  for index, screen in ipairs(screens) do
    if screen:id() == targetScreen:id() then
      -- mpv's macOS keymap stops at F20, so only the first 8 displays are reachable.
      local functionKey = 12 + index
      if functionKey <= 20 then
        hs.eventtap.keyStroke({}, "f" .. functionKey, 0, app)
      end

      if reframe then
        later(0.75, function()
          local moved = focusedWindow(app)
          if moved and moved:screen():id() == targetScreen:id() then
            applyFrame(moved, targetScreen)
          end
        end)
      end

      return
    end
  end
end

-- Exposed so `hs -c` can drive and time this without a keypress.
function config.moveNextDisplay()
  local app = hs.application.frontmostApplication()
  local window = focusedWindow(app)
  local screens = hs.screen.allScreens()

  if not window or #screens < 2 then return end

  local currentScreen = window:screen()
  local targetScreen = currentScreen:next()

  -- A fullscreen window has no geometry worth keeping, and reframing it would
  -- only knock it out of fullscreen.
  local wasFilling = isFillingScreen(window, currentScreen)
  local isMpv = app:name() == "mpv"

  if wasFilling then
    if isMpv then moveMpvViaScript(app, screens, targetScreen, false) end
    return
  end

  rememberFrame(window, currentScreen)

  -- A known-rejecting screen would just flash the window in place before the
  -- bounce, so skip straight to the bounce.
  if isMpv and rejectsAX(targetScreen) then
    moveMpvViaScript(app, screens, targetScreen, true)
    return
  end

  applyFrame(window, targetScreen)

  if not isMpv then return end

  -- Instant when the move takes; we only pay this probe the first time a given
  -- display turns out to reject it.
  later(0.1, function()
    local moved = focusedWindow(app)
    if moved and moved:screen():id() ~= targetScreen:id() then
      noteAXRejected(targetScreen)
      moveMpvViaScript(app, screens, targetScreen, true)
    end
  end)
end

local function focusMpv()
  local apps = mpvApplications()

  if #apps == 0 then
    hs.execute("/opt/homebrew/bin/mpv --idle=yes --force-window=yes >/dev/null 2>&1 &")
    hs.timer.doAfter(0.5, function()
      local launched = mpvApplications()[1]
      if launched then launched:activate(true) end
    end)
    return
  end

  local current = hs.application.frontmostApplication()
  local target

  for index, app in ipairs(apps) do
    if current and app:pid() == current:pid() then
      target = apps[(index % #apps) + 1]
      break
    end
  end

  if not target and lastMpvPid then
    for _, app in ipairs(apps) do
      if app:pid() == lastMpvPid then
        target = app
        break
      end
    end
  end

  (target or apps[1]):activate(true)
end

-- Hyper+key app focusing (moved from Slate)
hs.hotkey.bind(hyper, "t", function() hs.application.launchOrFocus("Ghostty") end)
hs.hotkey.bind(hyper, "q", function() hs.application.launchOrFocus("Anki") end)
hs.hotkey.bind(hyper, "a", function() hs.application.launchOrFocus("Brave Browser Beta") end)
hs.hotkey.bind(hyper, "g", function() hs.application.launchOrFocus("Finder") end)
hs.hotkey.bind(hyper, "p", function() hs.application.launchOrFocus("Preview") end)
hs.hotkey.bind(hyper, "c", function() hs.application.launchOrFocus("ChatGPT Classic") end)
hs.hotkey.bind(hyper, "r", function() hs.application.launchOrFocus("Microsoft Excel") end)
hs.hotkey.bind(hyper, "e", function() hs.application.launchOrFocus("Evernote") end)
hs.hotkey.bind(hyper, "d", function() hs.application.launchOrFocus("Discord") end)
hs.hotkey.bind(hyper, "z", function() hs.application.launchOrFocus("Gemini") end)
hs.hotkey.bind(hyper, "x", function() hs.application.launchOrFocus("Claude") end)
hs.hotkey.bind(hyper, "v", focusMpv)
hs.hotkey.bind(hyper, "o", config.moveNextDisplay)
hs.hotkey.bind(hyper, "n", function() hs.application.launchOrFocus("Notion") end)
hs.hotkey.bind(hyper, "b", function() hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(hyper, "y", function() hs.application.launchOrFocus("Books") end)
hs.hotkey.bind(hyper, "e", function() hs.application.launchOrFocus("Obsidian") end)
hs.hotkey.bind(hyper, "l", function() hs.application.launchOrFocus("Marked 2") end)

-- function focusBrave()
--   hs.application.launchOrFocus("Brave Browser Beta")
-- end

-- hs.hotkey.bind(hyper, "a", focusBrave)

-- Jump to Whatsapp
hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, '`', nil, function()
  hs.osascript.javascript([[
  (function() {
    let chrome = Application('Google Chrome');
    chrome.activate();
    for (win of chrome.windows()) {
      let tabIndex =
        win.tabs().findIndex(tab => tab.url().match(/web.whatsapp.com/));
      if (tabIndex != -1) {
        win.activeTabIndex = (tabIndex + 1);
        win.index = 1;

        let app = Application.currentApplication();
        app.includeStandardAdditions = true;
        delay(0.01)
        app.doShellScript('open -a "Google Chrome"');
        return;
      }
    }
  })();
  ]])
end)

-- Jump to messages
hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 'm', nil, function()
  hs.osascript.javascript([[
  (function() {
    let chrome = Application('Google Chrome');
    chrome.activate();
    for (win of chrome.windows()) {
      let tabIndex =
        win.tabs().findIndex(tab => tab.url().match(/messages.google.com/));
      if (tabIndex != -1) {
        win.activeTabIndex = (tabIndex + 1);
        win.index = 1;

        let app = Application.currentApplication();
        app.includeStandardAdditions = true;
        delay(0.01)
        app.doShellScript('open -a "Google Chrome"');
        return;
      }
    }
  })();
  ]])
end)

-- Jump to gdocs spreadsheet
hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 's', nil, function()
  hs.osascript.javascript([[
  (function() {
    let chrome = Application('Google Chrome');
    chrome.activate();
    for (win of chrome.windows()) {
      let tabIndex =
        win.tabs().findIndex(tab => tab.url().match(/docs.google.com\/spreadsheets/));
      if (tabIndex != -1) {
        win.activeTabIndex = (tabIndex + 1);
        win.index = 1;

        let app = Application.currentApplication();
        app.includeStandardAdditions = true;
        delay(0.01)
        app.doShellScript('open -a "Google Chrome"');
        return;
      }
    }
  })();
  ]])
end)
