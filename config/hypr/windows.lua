-- Personal window rules. See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Float everything by default. Preferring a floating, mac-like single-view
-- workflow (hyper+letter app-focus, see bindings.lua) over Hyprland's tiling
-- model -- not a fan of tiling on a 13" display, and no interest in
-- workspace-based navigation.
o.window(".*", { float = true })
