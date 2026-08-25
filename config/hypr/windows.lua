-- Personal window rules. See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Restore Omarchy's current subtle compositor opacity for terminals. This was
-- forced to 1.0/1.0 in cb7f145 when Omarchy used a much stronger 0.97/0.9;
-- current Omarchy defaults are a quieter 0.985/0.96 (focused/unfocused).
o.window({ tag = "terminal" }, { opacity = "0.985 0.96" })

-- Instant transitions everywhere (open/close/move/resize/fullscreen) --
-- no per-window "just the fullscreen transition" option exists in
-- Hyprland, animation is all-or-nothing per window.
o.window(".*", { animation = "none" })
