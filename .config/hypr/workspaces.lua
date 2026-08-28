-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true})
hl.workspace_rule({ workspace = "2", monitor = "DP-1"})
hl.workspace_rule({ workspace = "3", monitor = "DP-1"})
hl.workspace_rule({ workspace = "4", monitor = "DP-1"})
hl.workspace_rule({ workspace = "5", monitor = "DP-1"})
hl.workspace_rule({ workspace = "6", monitor = "DP-2", default = true})
hl.workspace_rule({ workspace = "7", monitor = "DP-2"})
hl.workspace_rule({ workspace = "8", monitor = "DP-2"})
hl.workspace_rule({ workspace = "9", monitor = "DP-2"})
hl.workspace_rule({ workspace = "10", monitor = "DP-2"})


-- Special
hl.workspace_rule({workspace = "special:Music", gaps_in = 10, gaps_out = 40, on_created_empty = "flatpak run dev.aunetx.deezer"})
