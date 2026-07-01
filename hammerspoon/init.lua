config = {}
local hyper = {"cmd", "alt", "ctrl", "shift"}

local function focusMpv()
  local app = hs.application.find("mpv")

  if app then
    app:activate()
    return
  end

  hs.execute("/opt/homebrew/bin/mpv --idle=yes --force-window=yes >/dev/null 2>&1 &")
  hs.timer.doAfter(0.5, function()
    local launched = hs.application.find("mpv")
    if launched then launched:activate() end
  end)
end

-- Hyper+key app focusing (moved from Slate)
hs.hotkey.bind(hyper, "t", function() hs.application.launchOrFocus("Ghostty") end)
hs.hotkey.bind(hyper, "q", function() hs.application.launchOrFocus("Anki") end)
hs.hotkey.bind(hyper, "a", function() hs.application.launchOrFocus("Brave Browser Beta") end)
hs.hotkey.bind(hyper, "g", function() hs.application.launchOrFocus("Finder") end)
hs.hotkey.bind(hyper, "p", function() hs.application.launchOrFocus("Preview") end)
hs.hotkey.bind(hyper, "c", function() hs.application.launchOrFocus("ChatGPT") end)
hs.hotkey.bind(hyper, "r", function() hs.application.launchOrFocus("Microsoft Excel") end)
hs.hotkey.bind(hyper, "e", function() hs.application.launchOrFocus("Evernote") end)
hs.hotkey.bind(hyper, "d", function() hs.application.launchOrFocus("Discord") end)
hs.hotkey.bind(hyper, "z", function() hs.application.launchOrFocus("Gemini") end)
hs.hotkey.bind(hyper, "x", function() hs.application.launchOrFocus("Claude") end)
hs.hotkey.bind(hyper, "v", focusMpv)
hs.hotkey.bind(hyper, "n", function() hs.application.launchOrFocus("Notion") end)
hs.hotkey.bind(hyper, "b", function() hs.application.launchOrFocus("Google Chrome") end)

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
