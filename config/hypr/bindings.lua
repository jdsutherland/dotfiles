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
o.bind("SUPER + SHIFT + ALT + CTRL + V", "mpv", { launch = "mpv --idle=yes --force-window=yes", focus = "^mpv$" })
o.bind("SUPER + SHIFT + ALT + CTRL + B", "Chrome", { launch = "google-chrome-stable", focus = "^google-chrome$" })
-- xkbcommon names the grave keysym "grave"; the upper-case "GRAVE" does not match.
o.bind("SUPER + SHIFT + ALT + CTRL + grave", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })
o.bind("SUPER + SHIFT + ALT + CTRL + E", "Obsidian", { launch = "obsidian", focus = "^obsidian$" })
o.bind("SUPER + SHIFT + ALT + CTRL + M", "Google Messages", { webapp = "https://messages.google.com/web/conversations", focus = true })
o.bind("SUPER + SHIFT + ALT + CTRL + S", "Google Sheets", { webapp = "https://docs.google.com/spreadsheets/", focus = true })

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
