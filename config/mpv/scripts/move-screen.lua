local mp = require("mp")

local moving = false

local function moveToScreen(screen)
  if moving then return end
  moving = true

  local wasFullscreen = mp.get_property_native("fullscreen")
  local nativeFullscreen = mp.get_property_native("native-fs")

  if wasFullscreen then
    mp.set_property_native("fullscreen", false)
  end

  mp.add_timeout(wasFullscreen and 0.5 or 0, function()
    -- mpv ignores cross-display Accessibility moves on macOS. Briefly using
    -- its non-native fullscreen mode makes it honor screen/fs-screen instead.
    mp.set_property_native("native-fs", false)
    mp.set_property_number("screen", screen)
    mp.set_property_number("fs-screen", screen)
    mp.set_property_native("fullscreen", true)

    mp.add_timeout(0.25, function()
      if not wasFullscreen then
        mp.set_property_native("fullscreen", false)
      end

      mp.add_timeout(0.25, function()
        if not wasFullscreen then
          mp.set_property_native("native-fs", nativeFullscreen)
        end
        moving = false
      end)
    end)
  end)
end

-- Hammerspoon sends F13 + the zero-based mpv screen index.
for screen = 0, 11 do
  mp.add_key_binding("F" .. (13 + screen), "move-to-screen-" .. screen, function()
    moveToScreen(screen)
  end)
end
