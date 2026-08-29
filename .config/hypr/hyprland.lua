-- ╔╗ ╔╗╔╗  ╔╗╔═══╗╔═══╗╔╗   ╔═══╗╔═╗ ╔╗╔═══╗
-- ║║ ║║║╚╗╔╝║║╔═╗║║╔═╗║║║   ║╔═╗║║║╚╗║║╚╗╔╗║
-- ║╚═╝║╚╗╚╝╔╝║╚═╝║║╚═╝║║║   ║║ ║║║╔╗╚╝║ ║║║║
-- ║╔═╗║ ╚╗╔╝ ║╔══╝║╔╗╔╝║║ ╔╗║╚═╝║║║╚╗║║ ║║║║
-- ║║ ║║  ║║  ║║   ║║║╚╗║╚═╝║║╔═╗║║║ ║║║╔╝╚╝║
-- ╚╝ ╚╝  ╚╝  ╚╝   ╚╝╚═╝╚═══╝╚╝ ╚╝╚╝ ╚═╝╚═══╝



-- ░▄▀▒░█▒░░▄▀▄░██▄▒▄▀▄░█▒░░▄▀▀
-- ░▀▄█▒█▄▄░▀▄▀▒█▄█░█▀█▒█▄▄▒▄██

Terminal    = "ghostty"
FileManager = "dolphin"
Browser     = "librewolf"
MainMod = "SUPER + " -- Sets "Windows" key as main modifier
Shift = "SHIFT + "
Ctrl = "CTRL + "

-- noctalia ipc
Ipc = "noctalia msg "



-- ▒▄▀▄░█▒█░▀█▀░▄▀▄░▄▀▀░▀█▀▒▄▀▄▒█▀▄░▀█▀
-- ░█▀█░▀▄█░▒█▒░▀▄▀▒▄██░▒█▒░█▀█░█▀▄░▒█▒
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function () 
   hl.exec_cmd("noctalia")
   hl.exec_cmd("hyprpm reload")
end)



-- ▒██▀░█▄░█░█▒█░░░█▒█▒▄▀▄▒█▀▄░▄▀▀
-- ░█▄▄░█▒▀█░▀▄▀▒░░▀▄▀░█▀█░█▀▄▒▄██
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")



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
