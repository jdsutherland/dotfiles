-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

hl.config({
  input = {
    -- Stop a stray thumb on the trackpad from stealing keyboard focus
    -- mid-sentence. Omarchy defaults to follow_mouse = 1 (focus follows
    -- hover), and with gaps_in = 0 there is no dead zone between windows, so
    -- a few pixels of accidental cursor drift lands the next keystrokes in a
    -- different window. 2 detaches cursor focus from keyboard focus: hover
    -- and scroll still target the window under the pointer, but keyboard
    -- focus only moves on a real click.
    follow_mouse = 2,

    touchpad = {
      -- Use natural (inverse) scrolling, matching macOS.
      natural_scroll = true,

      -- A resting/brushing thumb otherwise registers as a click, which moves
      -- the text insertion point. disable_while_typing (on by default) does
      -- not catch this: libinput only suppresses touches that *begin* during
      -- the typing window, so a thumb already down keeps emitting events.
      -- Physical clicks still work, including two-finger right-click via
      -- clickfinger_behavior.
      tap_to_click = false,

      -- Follows from the above: without it a thumb tap plus drift starts a
      -- drag and selects text.
      tap_and_drag = false,
    },
  },
})

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- hl.config({
--   input = {
--     -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt.
--     kb_layout = "us,dk,eu",
--     kb_options = "compose:caps,grp:alts_toggle",
--
--     -- Use a specific keyboard variant if needed (e.g. intl for international keyboards).
--     kb_variant = "intl",
--
--     -- Change speed of keyboard repeat.
--     repeat_rate = 40,
--     repeat_delay = 250,
--
--     -- Start with numlock on by default.
--     numlock_by_default = true,
--
--     -- Increase sensitivity for mouse/trackpad (default: 0).
--     sensitivity = 0.35,
--
--     -- Turn off mouse acceleration (default: adaptive).
--     accel_profile = "flat",
--
--     touchpad = {
--       -- Use natural (inverse) scrolling.
--       natural_scroll = true,
--
--       -- Use two-finger clicks for right-click instead of lower-right corner.
--       clickfinger_behavior = true,
--
--       -- Control the speed of your scrolling.
--       scroll_factor = 0.4,
--
--       -- Enable the touchpad while typing.
--       disable_while_typing = false,
--
--       -- Left-click-and-drag with three fingers.
--       drag_3fg = 1,
--     },
--   },
-- })

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })
