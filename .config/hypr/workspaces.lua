-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

SPECIAL_GAPS_IN = 10
SPECIAL_GAPS_OUT = 40

hl.workspace_rule({ workspace = "1", persistent = true, monitor = "DP-1", default = true})
hl.workspace_rule({ workspace = "2", persistent = true, monitor = "DP-1"})
hl.workspace_rule({ workspace = "3", persistent = true, monitor = "DP-1"})
hl.workspace_rule({ workspace = "4", persistent = true, monitor = "DP-1"})
hl.workspace_rule({ workspace = "5", persistent = true, monitor = "DP-1"})
hl.workspace_rule({ workspace = "6", persistent = true, monitor = "DP-2", default = true})
hl.workspace_rule({ workspace = "7", persistent = true, monitor = "DP-2"})
hl.workspace_rule({ workspace = "8", persistent = true, monitor = "DP-2"})
hl.workspace_rule({ workspace = "9", persistent = true, monitor = "DP-2"})
hl.workspace_rule({ workspace = "10", persistent = true, monitor = "DP-2"})

-- Special
hl.workspace_rule({workspace = "special:Music", gaps_in = SPECIAL_GAPS_IN, gaps_out = SPECIAL_GAPS_OUT, on_created_empty = "flatpak run dev.aunetx.deezer"})
hl.workspace_rule({workspace = "special:Sysmon", gaps_in = SPECIAL_GAPS_IN, gaps_out = SPECIAL_GAPS_OUT, on_created_empty = "plasma-systemmonitor"})
hl.workspace_rule({workspace = "special:Explorer", gaps_in = SPECIAL_GAPS_IN, gaps_out = SPECIAL_GAPS_OUT, on_created_empty = "dolphin"})
