-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
function get_workspace(i)
  local ws = hl.get_active_workspace()
  if ws.monitor.id == 0 then
    return i
  else
    if i <= 5 then
      return i + 5
    else
      return i - 5
    end
  end
end

-- Start applications
hl.bind(MainMod .. "Return", hl.dsp.exec_cmd(Terminal))
hl.bind(MainMod .. "Q", hl.dsp.exec_cmd(Browser))
hl.bind(MainMod .. "E", hl.dsp.exec_cmd(FileManager))

-- Toggle panels
hl.bind(MainMod .. "Z", hl.dsp.exec_cmd(Ipc .. "panel-toggle wallpaper"))
hl.bind(MainMod .. "V", hl.dsp.exec_cmd(Ipc .. "panel-toggle clipboard"))
hl.bind(MainMod .. "X", hl.dsp.exec_cmd(Ipc .. "panel-toggle control-center"))
hl.bind(MainMod .. "N", hl.dsp.exec_cmd(Ipc .. "panel-toggle control-center notifications"))
hl.bind(MainMod .. "Space", hl.dsp.exec_cmd(Ipc .. "panel-toggle launcher"))
hl.bind(MainMod .. Shift .. "T", hl.dsp.exec_cmd(Ipc .. "panel-toggle noctalia/timer:panel"))
hl.bind(MainMod .. Shift .. "Z", hl.dsp.exec_cmd(Ipc .. "panel-toggle noctalia/wallpaper_depth:manager"))
hl.bind(MainMod .. "Tab", function() hl.plugin.hyprexpo.expo("toggle") end)

if hl.plugin.hyprexpo ~= nil then
  hl.bind(MainMod .. Shift .. "S", hl.plugin.hyprcapture.open)
end


-- Send a graceful request to close the window
hl.bind(MainMod .. "C", hl.dsp.window.close())
-- Kill the process owning the window with a SIGKILL
hl.bind(MainMod .. Shift .. "C", hl.dsp.window.kill())

-- Toggle Gaps
hl.bind(MainMod .. Shift .. "G", ToggleGaps)

-- Toggle Window Bars IN PROGRESS... HOPEFULLY
hl.bind(MainMod .. Ctrl .. "T", hl.dsp.window.tag({ tag = "has-bar" }))

hl.bind(MainMod .. Shift .. "Q",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(MainMod .. Shift .. "F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MainMod .. Shift .. "P", hl.dsp.window.pseudo())
hl.bind(MainMod .. "S", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(MainMod .. "H", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. "J", hl.dsp.focus({ direction = "down" }))
hl.bind(MainMod .. "K", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. "L", hl.dsp.focus({ direction = "right" }))

-- Resize windows
local resizeUnit = 50
hl.bind(MainMod .. Ctrl .. "H", hl.dsp.window.resize({ x = -resizeUnit, y = 0, relative = true }),

  { repeating = true })
hl.bind(MainMod .. Ctrl .. "J", hl.dsp.window.resize({ x = 0, y = resizeUnit, relative = true }), { repeating = true })
hl.bind(MainMod .. Ctrl .. "K", hl.dsp.window.resize({ x = 0, y = -resizeUnit, relative = true }),
  { repeating = true })
hl.bind(MainMod .. Ctrl .. "L", hl.dsp.window.resize({ x = resizeUnit, y = 0, relative = true }), { repeating = true })

-- Move Windows
hl.bind(MainMod .. Shift .. "H", hl.dsp.window.move({ direction = "left" }))
hl.bind(MainMod .. Shift .. "J", hl.dsp.window.move({ direction = "down" }))
hl.bind(MainMod .. Shift .. "K", hl.dsp.window.move({ direction = "up" }))
hl.bind(MainMod .. Shift .. "L", hl.dsp.window.move({ direction = "right" }))


-- Workspaces manoeuoeveours
for i = 1, 10 do
  local key = i % 10
  hl.bind(MainMod .. key, function()
    local w = get_workspace(i)
    hl.dispatch(hl.dsp.focus({ workspace = w }))
  end)
  hl.bind(MainMod .. Shift .. key, function()
    local w = get_workspace(i)
    hl.dispatch(hl.dsp.window.move({ workspace = w, follow = true }))
  end
  )
end

-- Special workspaces
hl.bind(MainMod .. "M", hl.dsp.workspace.toggle_special("Music"))
hl.bind(MainMod .. "comma", hl.dsp.workspace.toggle_special("Sysmon"))
hl.bind(MainMod .. "period", hl.dsp.workspace.toggle_special("Explorer"))

-- Maximize - Window takes up the entire working space, keeping the margins.
hl.bind(MainMod .. "G", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
-- Fullscreen - Window takes up the entire screen.
hl.bind(MainMod .. "F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(MainMod .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MainMod .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(MainMod .. "bracketleft", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind(MainMod .. "bracketright", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind(MainMod .. Shift .. "bracketleft", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind(MainMod .. "P", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(MainMod .. Shift .. "bracketright", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
