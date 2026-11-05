-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

SPECIAL_GAPS_IN = 10
SPECIAL_GAPS_OUT = 40

local function configure_workspaces()
    local monitors = hl.get_monitors()
    if not monitors or #monitors <= 1 then return end

    -- 1. Sort physically from left to right (X position)
    table.sort(monitors, function(a, b) 
        return (a.x or 0) < (b.x or 0) 
    end)

    -- 2. Reorder according to your preference
    if #monitors >= 3 then
        monitors[1], monitors[2], monitors[3] = monitors[2], monitors[3], monitors[1]
    end

    -- 3. Assign workspace to monitor
    workspace_id = 1
    for _, monitor in ipairs(monitors) do
        for i = 1, 5 do
            hl.workspace_rule({
                workspace = tostring(workspace_id),
                persistent = true,
                monitor = monitor.name,
                default = (workspace_id - 1) % 5 == 0
            })
            workspace_id = workspace_id + 1
        end
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
hl.workspace_rule({workspace = "special:Torrent", gaps_in = SPECIAL_GAPS_IN, gaps_out = SPECIAL_GAPS_OUT})



hl.on("workspace.created", function(ws)
    if not ws.is_empty then return end

    local special_apps = {
        ["special:Music"] = "flatpak run com.spotify.Client",
        ["special:Sysmon"] = "plasma-systemmonitor",
        ["special:Explorer"] = "dolphin",
        ["special:Torrent"] = "qbittorrent",
    }

    local cmd = special_apps[ws.name]
    if cmd then
        hl.exec_cmd(cmd, { workspace = ws.name .. " silent" })
    end

end)
