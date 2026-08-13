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
