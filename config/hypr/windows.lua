-- Personal window rules. See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Float everything by default. Preferring a floating, mac-like single-view
-- workflow (hyper+letter app-focus, see bindings.lua) over Hyprland's tiling
-- model -- not a fan of tiling on a 13" display, and no interest in
-- workspace-based navigation.
o.window(".*", { float = true })

-- Omarchy's default terminals.lua tags terminals (incl. Ghostty) "terminal"
-- and applies opacity = "0.97 0.9" (focused/unfocused), letting the
-- wallpaper show through. Full opacity instead.
o.window({ tag = "terminal" }, { opacity = "1.0 1.0" })

-- Instant transitions everywhere (open/close/move/resize/fullscreen) --
-- no per-window "just the fullscreen transition" option exists in
-- Hyprland, animation is all-or-nothing per window.
o.window(".*", { animation = "none" })

-- Fullscreen whenever shown, for the hyper+letter app-focus targets (see
-- bindings.lua) -- one app fills the view at a time, mac-like, rather
-- than floating-centered. Chromium deliberately excluded (regular
-- browsing wants a normal resizable window, not force-fullscreen).
o.window("com.mitchellh.ghostty", { fullscreen = true })
o.window("org.gnome.Nautilus", { fullscreen = true })
o.window("org.gnome.Evince", { fullscreen = true })
o.window("chrome-chatgpt.com__-Default", { fullscreen = true })
o.window("libreoffice-calc", { fullscreen = true })
o.window("chrome-discord.com__channels_@me-Default", { fullscreen = true })
o.window("mpv", { fullscreen = true })
o.window("chrome-web.whatsapp.com__-Default", { fullscreen = true })
o.window("obsidian", { fullscreen = true })
o.window("chrome-messages.google.com__web_conversations-Default", { fullscreen = true })
o.window("chrome-docs.google.com__spreadsheets_-Default", { fullscreen = true })

-- Experiment: pin specific apps to specific workspaces by default, as an
-- alternative to (or alongside) the float+fullscreen hyper-focus model
-- above. Starting with just these two.
o.window("chromium", { workspace = "1" })
o.window("com.mitchellh.ghostty", { workspace = "2" })
