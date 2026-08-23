-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, { omarchy = "walker -m symbols" })

-- Hyper (right_control held, via keyd -> ctrl+super+alt+shift) app-focus
-- binds, ported from mac Hammerspoon. See KEYBINDINGS.md. Coexists with
-- Omarchy's own SUPER-based defaults rather than replacing any of them.
o.bind("SUPER + SHIFT + ALT + CTRL + T", "Ghostty", { launch = "ghostty --gtk-single-instance=true", focus = "^com.mitchellh.ghostty$" })
o.bind("SUPER + SHIFT + ALT + CTRL + G", "Nautilus", { launch = "nautilus", focus = "^org.gnome.Nautilus$" })
o.bind("SUPER + SHIFT + ALT + CTRL + P", "Evince", { launch = "evince", focus = "^org.gnome.Evince$" })
o.bind("SUPER + SHIFT + ALT + CTRL + C", "ChatGPT", { webapp = "https://chatgpt.com", focus = true })
o.bind("SUPER + SHIFT + ALT + CTRL + R", "LibreOffice Calc", { launch = "libreoffice --calc", focus = "^libreoffice-calc$" })
o.bind("SUPER + SHIFT + ALT + CTRL + D", "Discord", { webapp = "https://discord.com/channels/@me", focus = true })
-- mpv: hyper+V cycles through open mpv windows on repeated presses (each
-- press focuses the next one), and launches a new instance when none exist.
-- Plain launch+focus (like the other hyper binds here) always jumps to the
-- first match returned by omarchy-launch-or-focus, so with >1 mpv window
-- open it can never reach the others.
local function cycle_or_launch_mpv()
  -- hl.get_windows' class filter is an exact match, not a regex -- unlike
  -- Hyprland's window rules (and unlike focus="^mpv$" on the other hyper
  -- binds above, which goes through a completely different, regex-based
  -- script). "^mpv$" matched nothing here, so #wins was always 0 and this
  -- launched a fresh mpv on every press instead of finding the existing one.
  local wins = hl.get_windows({ class = "mpv" })
  if #wins == 0 then
    hl.exec_cmd(o.launch("mpv --idle=yes --force-window=yes"))
    return
  end

  -- Stable order across presses -- get_windows makes no ordering guarantee.
  table.sort(wins, function(a, b) return a.address < b.address end)

  local active = hl.get_active_window()
  local next_win = wins[1]
  if active then
    for i, w in ipairs(wins) do
      if w.address == active.address then
        next_win = wins[(i % #wins) + 1]
        break
      end
    end
  end

  hl.dispatch(hl.dsp.focus({ window = "address:" .. next_win.address }))
end
o.bind("SUPER + SHIFT + ALT + CTRL + V", "mpv (cycle windows)", cycle_or_launch_mpv)
o.bind("SUPER + SHIFT + ALT + CTRL + B", "Chrome", { launch = "google-chrome-stable", focus = "^google-chrome$" })
-- xkbcommon names the grave keysym "grave"; the upper-case "GRAVE" does not match.
o.bind("SUPER + SHIFT + ALT + CTRL + grave", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })
o.bind("SUPER + SHIFT + ALT + CTRL + E", "Obsidian", { launch = "obsidian", focus = "obsidian" })
o.bind("SUPER + SHIFT + ALT + CTRL + M", "Google Messages", { webapp = "https://messages.google.com/web/conversations", focus = true })
o.bind("SUPER + SHIFT + ALT + CTRL + S", "Google Sheets", { webapp = "https://docs.google.com/spreadsheets/", focus = true })

-- Move the focused window to the nearest empty workspace on the CURRENT
-- monitor (by workspace number; ties go to the higher number). Workspaces are
-- global in Hyprland, so treating an empty workspace on another monitor as a
-- candidate made this shortcut appear to jump displays at random.
--
-- A workspace Hyprland has never created is safe: it is created on the active
-- monitor. An existing workspace is eligible only when it belongs to this
-- monitor and has no windows.
local function move_to_nearest_empty_workspace()
  local current = hl.get_active_workspace()
  if not current or not current.monitor then return end

  local existing = {}
  local max_id = current.id
  for _, ws in ipairs(hl.get_workspaces()) do
    if not ws.special then
      existing[ws.id] = ws
      if ws.id > max_id then max_id = ws.id end
    end
  end

  for distance = 1, max_id do
    for _, candidate in ipairs({ current.id + distance, current.id - distance }) do
      if candidate >= 1 then
        local ws = existing[candidate]
        local empty_here = ws
          and ws.monitor
          and ws.monitor.id == current.monitor.id
          and ws.windows == 0
        if ws == nil or empty_here then
          hl.dispatch(hl.dsp.window.move({ workspace = tostring(candidate) }))
          return
        end
      end
    end
  end
end
o.bind("SUPER + SHIFT + ALT + CTRL + RIGHT", "Move window to nearest empty workspace (same monitor)", move_to_nearest_empty_workspace)

-- Move the focused window to the active workspace on the next physical
-- monitor, ordered left-to-right then top-to-bottom. With two displays this
-- simply toggles the window between them; focus follows the moved window.
local function move_window_to_next_monitor()
  local window = hl.get_active_window()
  local current_monitor = window and window.workspace and window.workspace.monitor
  if not current_monitor then return end

  local monitors = {}
  for _, monitor in ipairs(hl.get_monitors()) do
    if not monitor.is_mirror and monitor.active_workspace then
      table.insert(monitors, monitor)
    end
  end
  if #monitors < 2 then return end

  table.sort(monitors, function(a, b)
    if a.x ~= b.x then return a.x < b.x end
    if a.y ~= b.y then return a.y < b.y end
    return a.id < b.id
  end)

  for i, monitor in ipairs(monitors) do
    if monitor.id == current_monitor.id then
      local target = monitors[(i % #monitors) + 1]
      hl.dispatch(hl.dsp.window.move({ workspace = tostring(target.active_workspace.id) }))
      return
    end
  end
end
o.bind("SUPER + SHIFT + ALT + CTRL + O", "Move window to next monitor", move_window_to_next_monitor)

-- Vim-style navigation: J/K move workspaces (left/right), H/L focus windows
-- (left/right). Move Keybindings, window-split, and workspace-layout off
-- their old keys; unbind the Omarchy defaults first, then rebind.
hl.unbind("SUPER + K")
hl.unbind("SUPER + J")
hl.unbind("SUPER + L")

o.bind("SUPER + apostrophe", "Keybindings", "omarchy-menu-keybindings")
o.bind("SUPER + backslash", "Toggle window split", hl.dsp.layout("togglesplit"))
o.bind("SUPER + Q", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")
o.bind("SUPER + J", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
o.bind("SUPER + K", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
o.bind("SUPER + H", "Focus previous window", hl.dsp.window.cycle_next({ next = false }))
o.bind("SUPER + L", "Focus next window", hl.dsp.window.cycle_next())

-- SUPER+W: double-press to close the focused window (guards against
-- accidental kills).
hl.unbind("SUPER + W")
local last_super_w = 0
o.bind("SUPER + W", "Close window (double-press)", function()
  local now = os.clock()
  if now - last_super_w < 1.0 then
    last_super_w = 0
    hl.dispatch(hl.dsp.window.close())
  else
    last_super_w = now
  end
end)

-- Cycle focus through windows of the same app (same WM class), e.g. Chrome
-- windows spread across workspaces. Mac's Cmd+` equivalent.
o.bind("SUPER + grave", "Cycle app windows", "hypr-cycle-app")
