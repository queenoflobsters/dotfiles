-- ╔╗ ╔╗╔╗  ╔╗╔═══╗╔═══╗╔╗   ╔═══╗╔═╗ ╔╗╔═══╗
-- ║║ ║║║╚╗╔╝║║╔═╗║║╔═╗║║║   ║╔═╗║║║╚╗║║╚╗╔╗║
-- ║╚═╝║╚╗╚╝╔╝║╚═╝║║╚═╝║║║   ║║ ║║║╔╗╚╝║ ║║║║
-- ║╔═╗║ ╚╗╔╝ ║╔══╝║╔╗╔╝║║ ╔╗║╚═╝║║║╚╗║║ ║║║║
-- ║║ ║║  ║║  ║║   ║║║╚╗║╚═╝║║╔═╗║║║ ║║║╔╝╚╝║
-- ╚╝ ╚╝  ╚╝  ╚╝   ╚╝╚═╝╚═══╝╚╝ ╚╝╚╝ ╚═╝╚═══╝



-- ░▄▀▒░█▒░░▄▀▄░██▄▒▄▀▄░█▒░░▄▀▀
-- ░▀▄█▒█▄▄░▀▄▀▒█▄█░█▀█▒█▄▄▒▄██

Terminal    = "foot"
FileManager = "dolphin"
Browser     = "librewolf"

-- noctalia ipc
Ipc = "noctalia msg "



-- ▒██▀░█▄░█░█▒█░░░█▒█▒▄▀▄▒█▀▄░▄▀▀
-- ░█▄▄░█▒▀█░▀▄▀▒░░▀▄▀░█▀█░█▀▄▒▄██
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_ENABLE_HIGHDPI_SCALING", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")



-- ▒▄▀▄░█▒█░▀█▀░▄▀▄░▄▀▀░▀█▀▒▄▀▄▒█▀▄░▀█▀
-- ░█▀█░▀▄█░▒█▒░▀▄▀▒▄██░▒█▒░█▀█░█▀▄░▒█▒
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function () 
   hl.exec_cmd("dbus-update-activation-environment --systemd --all")
   -- hl.exec_cmd("xsettingsd -c \"$HOME/.config/hypr/xsettingsd-hyprland.conf\"")
   hl.exec_cmd("xsettingsd")
   hl.exec_cmd("systemctl --user start hyprpolkitagent") -- Authentification
   hl.exec_cmd("noctalia")
   hl.exec_cmd("hyprpm reload")
end)



-- ▒█▀▄▒██▀▒█▀▄░█▄▒▄█░█░▄▀▀░▄▀▀░█░▄▀▄░█▄░█░▄▀▀
-- ░█▀▒░█▄▄░█▀▄░█▒▀▒█░█▒▄██▒▄██░█░▀▄▀░█▒▀█▒▄██

require("permissions")



-- ▒▄▀▄▒█▀▄▒█▀▄▒██▀▒▄▀▄▒█▀▄▒▄▀▄░█▄░█░▄▀▀▒██▀
-- ░█▀█░█▀▒░█▀▒░█▄▄░█▀█░█▀▄░█▀█░█▒▀█░▀▄▄░█▄▄

require("appearance")



-- ░█░░▒█░▄▀▄▒█▀▄░█▄▀░▄▀▀▒█▀▄▒▄▀▄░▄▀▀▒██▀░▄▀▀
-- ░▀▄▀▄▀░▀▄▀░█▀▄░█▒█▒▄██░█▀▒░█▀█░▀▄▄░█▄▄▒▄██

require("workspaces")



-- ░█▄▒▄█░█░▄▀▀░▄▀▀▒██▀░█▒░░█▒░▒▄▀▄░█▄░█▒██▀░▄▀▄░█▒█░▄▀▀
-- ░█▒▀▒█░█▒▄██░▀▄▄░█▄▄▒█▄▄▒█▄▄░█▀█░█▒▀█░█▄▄░▀▄▀░▀▄█▒▄██

require("miscellaneous")



-- ░█░█▄░█▒█▀▄░█▒█░▀█▀░▄▀▀
-- ░█░█▒▀█░█▀▒░▀▄█░▒█▒▒▄██

require("inputs")



--  ░█▄▀▒██▀░▀▄▀░██▄░█░█▄░█░█▀▄░▄▀▀
--  ░█▒█░█▄▄░▒█▒▒█▄█░█░█▒▀█▒█▄▀▒▄██

require("keybinds")



-- ░█░░▒█░█░█▄░█░█▀▄░▄▀▄░█░░▒█░▄▀▀
-- ░▀▄▀▄▀░█░█▒▀█▒█▄▀░▀▄▀░▀▄▀▄▀▒▄██

require("windows")


-- ░█▄▒▄█░▄▀▄░█▄░█░█░▀█▀░▄▀▄▒█▀▄░▄▀▀
--  █▒▀▒█░▀▄▀░█▒▀█░█░▒█▒░▀▄▀░█▀▄▒▄██

require("monitors")


-- ▒█▀▄░█▒░░█▒█░▄▀▒░█░█▄░█░▄▀▀
-- ░█▀▒▒█▄▄░▀▄█░▀▄█░█░█▒▀█▒▄██

require("plugins")


-- ░▀█▀░█▄█▒██▀░█▄▒▄█▒██▀
-- ░▒█▒▒█▒█░█▄▄░█▒▀▒█░█▄▄

-- For Noctalia Color templates
require("noctalia").apply_theme()
