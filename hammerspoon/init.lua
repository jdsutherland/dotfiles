config = {}
local hyper = {"cmd", "alt", "ctrl", "shift"}

function focusBrave()
  hs.application.launchOrFocus("Brave Browser Beta")
end

hs.hotkey.bind(hyper, "a", focusBrave)

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

-- Jump to chatgpt
hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 'c', nil, function()
  hs.osascript.javascript([[
  (function() {
    const chrome = Application('Google Chrome');
    chrome.activate();
    const win = chrome.windows[0];
    const tabIndex = win.tabs().findIndex(tab => tab.url().match(/chat.openai.com/));
    if (tabIndex !== -1) {
      win.activeTabIndex = (tabIndex + 1);
      win.index = 1;
    } else {
      win.tabs.push(new chrome.Tab());
      win.activeTab.url = "https://chat.openai.com/chat"
    }
  })();

  ]])
end)

-- Jump to gdocs spreadsheet
hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, ';', nil, function()
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

-- Jump to sportsbook daily thread
hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 'n', nil, function()
  hs.osascript.javascript([[
  (function() {
    const openTodaysDailyThread = "[...document.querySelectorAll('.title')].find(e => e.textContent.includes('Sportsbook/Promos/Bonuses Daily')).children[1].click()"

    let chrome = Application('Google Chrome');
    chrome.activate();
    for (win of chrome.windows()) {
      let tabIndex =
        win.tabs().findIndex(tab => tab.url().includes("sportsbookpromosbonuses_daily"));
      if (tabIndex != -1) {
        win.activeTabIndex = (tabIndex + 1);
        win.index = 1;
        win.activeTab.execute({ javascript: "window.location.reload()" });
        return;
      } else {
        win.tabs.push(new chrome.Tab());
        win.activeTab.url = "https://old.reddit.com/r/sportsbook"
        delay(2)
        win.activeTab.execute({ javascript: openTodaysDailyThread })
        return;
      }
    }
  })();
  ]])
end)

-- Jump to dh arbs
hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 'z', nil, function()
  hs.osascript.javascript([[
  (function() {
    let chrome = Application('Google Chrome');
    chrome.activate();
    for (win of chrome.windows()) {
      let tabIndex =
        win.tabs().findIndex(tab => tab.url().match(/darkhorseodds.com\/arbitrage/));
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

-- Jump to browse odds
hs.hotkey.bind({"cmd", "shift", "option", "ctrl"}, 'x', nil, function()
  hs.osascript.javascript([[
  (function() {
    let chrome = Application('Google Chrome');
    chrome.activate();
    for (win of chrome.windows()) {
      let tabIndex =
        win.tabs().findIndex(tab => tab.url().match(/darkhorseodds.com\/browse/));
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
--     const js_click_login_btn = "document.evaluate('/html/body/div[1]/div/div/div/div[1]/header/div[2]/div[3]/a[1]/div/div', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click()"

--     win.activeTab.execute({ javascript: js_click_login_btn })
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
