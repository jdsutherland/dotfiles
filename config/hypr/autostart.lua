-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- App-scoped keyd overlay bindings (see config/keyd/app.conf, KEYBINDINGS.md).
-- Deliberately o.exec_on_start (not o.launch_on_start): -d double-forks to
-- daemonize, and o.launch_on_start wraps commands in uwsm-app (a systemd
-- scope) which would reap the detached child when the wrapping unit exits.
-- Requires the user to be in the `keyd` group (sudo usermod -aG keyd $USER,
-- then a fresh login).
o.exec_on_start("keyd-application-mapper -d")

-- Recreate the app/workspace layout that was open when this was configured.
-- These rules exist only while the login applications are opening: each rule
-- disables itself after its first matching window, so later windows from the
-- same app open normally on the current workspace.
local startup_apps = {
  {
    workspace = "1",
    class = "google-chrome",
    match = "^google-chrome$",
    command = o.launch("google-chrome-stable"),
  },
  {
    workspace = "2",
    class = "chrome-messages.google.com__web_conversations-Default",
    match = "^chrome-messages\\.google\\.com__web_conversations-Default$",
    command = o.launch_webapp("https://messages.google.com/web/conversations"),
  },
  {
    workspace = "3",
    class = "com.mitchellh.ghostty",
    match = "^com\\.mitchellh\\.ghostty$",
    command = o.launch("ghostty --gtk-single-instance=true"),
  },
  {
    workspace = "4",
    class = "chrome-chatgpt.com__-Default",
    match = "^chrome-chatgpt\\.com__-Default$",
    command = o.launch_webapp("https://chatgpt.com"),
  },
  {
    workspace = "5",
    class = "chrome-gemini.google.com__-Default",
    match = "^chrome-gemini\\.google\\.com__-Default$",
    command = o.launch_webapp("https://gemini.google.com"),
  },
  {
    workspace = "6",
    class = "md.obsidian.Obsidian",
    match = "^md\\.obsidian\\.Obsidian$",
    command = o.launch("obsidian"),
  },
  {
    workspace = "7",
    class = "chrome-discord.com__channels_@me-Default",
    match = "^chrome-discord\\.com__channels_@me-Default$",
    command = o.launch_webapp("https://discord.com/channels/@me"),
  },
  {
    workspace = "8",
    class = "mpv",
    match = "^mpv$",
    command = o.launch("mpv --idle=yes --force-window=yes"),
  },
}

for _, app in ipairs(startup_apps) do
  app.rule = hl.window_rule({
    name = "startup-layout-workspace-" .. app.workspace,
    enabled = false,
    match = { initial_class = app.match },
    workspace = app.workspace .. " silent",
  })
end

local startup_layout_active = false
local startup_layout_timeout

local function disable_startup_layout()
  startup_layout_active = false
  for _, app in ipairs(startup_apps) do
    app.pending = false
    app.rule:set_enabled(false)
  end
end

-- A mapped window has already had its startup rule applied. Disable that rule
-- immediately so a second window from the same app is not redirected.
hl.on("window.open", function(window)
  if not startup_layout_active or not window then return end

  local pending = false
  for _, app in ipairs(startup_apps) do
    if app.pending and window.initial_class == app.class then
      app.pending = false
      app.rule:set_enabled(false)
    end
    pending = pending or app.pending
  end

  if not pending then
    startup_layout_active = false
    if startup_layout_timeout then
      startup_layout_timeout:set_enabled(false)
      startup_layout_timeout = nil
    end
  end
end)

hl.on("hyprland.start", function()
  startup_layout_active = true

  -- Enable every rule before launching anything. Chromium may restore several
  -- native and web-app windows from one shared process, so PID-scoped exec
  -- rules are not reliable for this layout.
  for _, app in ipairs(startup_apps) do
    app.pending = true
    app.rule:set_enabled(true)
  end

  -- Do not leave a rule waiting indefinitely if an application fails to open.
  startup_layout_timeout = hl.timer(function()
    disable_startup_layout()
    startup_layout_timeout = nil
  end, { timeout = 60000, type = "oneshot" })

  for _, app in ipairs(startup_apps) do
    hl.exec_cmd(app.command)
  end
end)
