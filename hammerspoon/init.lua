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

local function moveFocusedWindowToNextDisplay()
  local app = hs.application.frontmostApplication()
  local window = app and (app:focusedWindow() or app:mainWindow() or app:allWindows()[1])
  local screens = hs.screen.allScreens()

  if not window or #screens < 2 then return end

  local targetScreen = window:screen():next()

  if app:name() == "mpv" then
    for index, screen in ipairs(screens) do
      if screen:id() == targetScreen:id() then
        local functionKey = 12 + index
        if functionKey <= 24 then
          hs.eventtap.keyStroke({}, "f" .. functionKey, 0, app)
        end
        return
      end
    end
    return
  end

  window:moveToScreen(targetScreen, false, true)
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
hs.hotkey.bind(hyper, "o", moveFocusedWindowToNextDisplay)
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
