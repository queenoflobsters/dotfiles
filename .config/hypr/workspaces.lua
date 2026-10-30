-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

SPECIAL_GAPS_IN = 10
SPECIAL_GAPS_OUT = 40

local function configure_workspaces()
    local monitors = hl.get_monitors()
    if #monitors == 0 then return end

    -- Sort monitors by their X position
    table.sort(monitors, function(a, b) 
        return (a.x or 0) < (b.x or 0) 
    end)

    local main_monitor = monitors[1].name
    local second_monitor = monitors[2] and monitors[2].name or main_monitor

    -- Assign Workspaces 1-5 to "main"
    for i = 1, 5 do
        hl.workspace_rule({
            workspace = tostring(i),
            persistent = true,
            monitor = main_monitor,
            default = (i == 1),
        })
    end

    -- Assign Workspaces 6-10 to "second"
    for i = 6, 10 do
        hl.workspace_rule({
            workspace = tostring(i),
            persistent = true,
            monitor = second_monitor,
            default = (i == 6),
        })
    end
end

-- Run at startup
configure_workspaces()

-- Changes in nwg-displays or hotplug
hl.on("monitor.layout_changed", configure_workspaces)
hl.on("monitor.added", configure_workspaces)
hl.on("monitor.removed", configure_workspaces)
hl.on("config.reloaded", configure_workspaces)

-- Special
hl.workspace_rule({workspace = "special:Music", gaps_in = SPECIAL_GAPS_IN, gaps_out = SPECIAL_GAPS_OUT})
hl.workspace_rule({workspace = "special:Sysmon", gaps_in = SPECIAL_GAPS_IN, gaps_out = SPECIAL_GAPS_OUT})
hl.workspace_rule({workspace = "special:Explorer", gaps_in = SPECIAL_GAPS_IN, gaps_out = SPECIAL_GAPS_OUT})

hl.on("workspace.created", function(ws)
    if not ws.is_empty then return end

    if ws.name == "special:Music" then
      hl.exec_cmd("flatpak run com.spotify.Client")
    elseif ws.name == "special:Sysmon" then
      hl.exec_cmd("plasma-systemmonitor")
    elseif ws.name == "special:Explorer" then
      hl.exec_cmd("dolphin")
    end
end)
