-- require ("google_docs")
-- require ("markbot")

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

-- -- Jump to chatgpt
-- hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 'c', nil, function()
--   hs.osascript.javascript([[
--   (function() {
--     const chrome = Application('Google Chrome');
--     chrome.activate();
--     const win = chrome.windows[0];
--     const tabIndex = win.tabs().findIndex(tab => tab.url().match(/chatgpt.com/));
--     if (tabIndex !== -1) {
--       win.activeTabIndex = (tabIndex + 1);
--       win.index = 1;
--     } else {
--       win.tabs.push(new chrome.Tab());
--       win.activeTab.url = "https:///chatgpt.com/"
--     }
--   })();

--   ]])
-- end)

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

-- -- Jump to gemini
-- hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 'z', nil, function()
--   hs.osascript.javascript([[
--   (function() {
--     let chrome = Application('Google Chrome');
--     chrome.activate();
--     for (win of chrome.windows()) {
--       let tabIndex =
--         win.tabs().findIndex(tab => tab.url().match(/gemini.google.com/));
--       if (tabIndex != -1) {
--         win.activeTabIndex = (tabIndex + 1);
--         win.index = 1;
--         let app = Application.currentApplication();
--         app.includeStandardAdditions = true;
--         delay(0.01)
--         app.doShellScript('open -a "Google Chrome"');
--         return;
--       }
--     }
--   })();
--   ]])
-- end)

-- -- Jump to browse odds
-- hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 'x', nil, function()
--   hs.osascript.javascript([[
--   (function() {
--     let chrome = Application('Google Chrome');
--     chrome.activate();
--     for (win of chrome.windows()) {
--       let tabIndex =
--         win.tabs().findIndex(tab => tab.url().match(/darkhorseodds.com\/browse/));
--       if (tabIndex != -1) {
--         win.activeTabIndex = (tabIndex + 1);
--         win.index = 1;
--         let app = Application.currentApplication();
--         app.includeStandardAdditions = true;
--         delay(0.01)
--         app.doShellScript('open -a "Google Chrome"');
--         return;
--       }
--     }
--   })();
--   ]])
-- end)

-- function chumbaClearAndReaddDontPass()
--     local script = [[
--         tell application "Google Chrome" to activate
--         on clickAt(x, y)
--             do shell script "/opt/homebrew/bin/cliclick c:" & x & "," & y
--         end clickAt

--         clickAt(1239, 1234) -- click x
--         delay 0.2

--         clickAt(800, 844) -- confirm clear

--         -- readd dont pass chip
--         repeat 4 times
--           delay 0.3
--           clickAt(900, 930)
--         end repeat

--         -- -- -- try every dont come number
--         repeat 3 times
--           delay 0.2
--           clickAt(550, 356)
--           clickAt(686, 356)
--           clickAt(812, 356)
--           clickAt(960, 356)
--           clickAt(1110, 356)
--           clickAt(1260, 356)
--         end repeat
--     ]]
--     hs.osascript.applescript(script)
-- end
-- hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, ";", chumbaClearAndReaddDontPass)

-- ASSUMPTIONS: messages.google 2nd tab, LL last tab and chrome is focused on LL homepage (logged in)
function luckylandBuy()
  local script = [[
  tell application "Google Chrome" to activate
  on clickAt(x, y)
    do shell script "/opt/homebrew/bin/cliclick c:" & x & "," & y
  end clickAt

  clickAt(600, 192) -- click buy
  delay 2

  clickAt(1062, 849) -- click "$19.99"
  delay 2
  clickAt(1000, 535) -- click discover card
  delay 1
  tell application "System Events" to tell process "Google Chrome" to keystroke "528"
  delay 1

  -- tell application "Google Chrome" to activate
  -- delay 1
  -- tell application "System Events"
  --   tell process "Google Chrome"
  --       set frontmost to true
  --       clickAt(562, 746)
  --       delay 1
  --       tell application "System Events"
  --           keystroke "5"
  --           delay 0.2
  --           keystroke "2"
  --           delay 0.2
  --           keystroke "8"
  --       end tell
  --   end tell
  -- end tell
  -- delay .2

  clickAt(1065, 875) -- click "Pay $19.99"
  delay 8 -- wait for discover to load

  clickAt(878, 605) -- click "continue" btn; sends text
  delay 4

  -- go to texts (assumes 2nd tab)
  tell application "Google Chrome"
    tell window 1
      set active tab index to 2
    end tell
  end tell
  delay 1

  clickAt(223, 294) -- click newest text (discover)
  delay 1

  do shell script "screencapture -R610,1130,530,75 /tmp/sms_code.png"
  delay 2

  do shell script "/opt/homebrew/bin/tesseract /tmp/sms_code.png /tmp/ocr_output"
  delay 1
  set ocrText to do shell script "cat /tmp/ocr_output.txt"
  delay 1

  -- Use AppleScript to extract the 6-digit code
  set code to do shell script "echo " & quoted form of ocrText & " | grep -o '\\b[0-9]\\{6\\}\\b' | head -n 1"
  delay 1

  -- Switch to the last tab in Chrome (assumes LL)
  tell application "Google Chrome" to activate
  delay 1 -- Ensures Chrome is active
  tell application "Google Chrome"
    set lastTabIndex to count of tabs in window 1
    tell window 1
      set active tab index to lastTabIndex
    end tell
  end tell
  delay 1

  clickAt(905, 501) -- click the discover code field
  delay 1

  -- Paste the OCR result as keystrokes
  tell application "System Events" to keystroke ocrText

  ]]
  hs.osascript.applescript(script)
end
-- hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, ";", luckylandBuy)

-- function chumbaClear()
--     local script = [[
--         tell application "Google Chrome" to activate
--         on clickAt(x, y)
--             do shell script "/opt/homebrew/bin/cliclick c:" & x & "," & y
--         end clickAt

--         clickAt(1239, 1234) -- click x
--         delay 0.1

--         clickAt(800, 844) -- confirm clear

--         -- readd dont pass chip
--         repeat 4 times
--           delay 0.1
--           clickAt(900, 930)
--         end repeat
--     ]]
--     hs.osascript.applescript(script)
-- end
-- hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, "'", chumbaClear)


-- -- Jump to fanduel
-- hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 's', nil, function()
--   hs.osascript.javascript([[
--   (function() {
--     const chrome = Application('Google Chrome');
--     chrome.activate();
--     const win = chrome.windows[0];
--     const tabIndex = win.tabs().findIndex(tab => tab.url().match(/fanduel.com/));
--     if (tabIndex !== -1) {
--       win.activeTabIndex = (tabIndex + 1);
--       win.index = 1;

--       const js_click_logbackin = "document.evaluate('/html/body/div[7]/div/div/div/div[3]/div[2]/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue?.click()"
--       win.activeTab.execute({ javascript: js_click_logbackin })
--     } else {
--       win.tabs.push(new chrome.Tab());
--       win.activeTab.url = "https://sportsbook.fanduel.com"
--       delay(2)
--     }
--     // const js_click_login_btn = "document.evaluate('/html/body/div[1]/div/div/div/div[1]/header/div[2]/div[3]/a[1]/div/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()"

--     // win.activeTab.execute({ javascript: js_click_login_btn })
--   })();
--   ]])
-- end)

-- Jump to TP
hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 'f', nil, function()
  hs.osascript.javascript([[
  (function() {
    const chrome = Application('Google Chrome');
    chrome.activate();
    const win = chrome.windows[0];
    const tabIndex = win.tabs().findIndex(tab => tab.url().match(/192.168.50.98/));
    if (tabIndex !== -1) {
      win.activeTabIndex = (tabIndex + 1);
      win.index = 1;
    } else {
      win.tabs.push(new chrome.Tab());
      win.activeTab.url = "http://192.168.50.98/"
      delay(4)
    }
    })();
  ]])
end)
