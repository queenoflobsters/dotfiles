# Hyprland + Noctalia

### Failed unit started : dbus-_3a1.2-com.redhat.imsettings@0.service

`imsettings` is Fedora's legacy Input Method framework (for managing IBus, Fcitx, XIM, etc.). When logging into a standalone Wayland compositor like Hyprland, imsettings-daemon tries to start via D-Bus activation, fails because it expects a standard desktop environment session (GNOME/X11), and registers as a failed unit

```bash
systemctl --user mask "dbus-:1.2-com.redhat.imsettings@0.service"
systemctl --user mask imsettings-daemon.service
systemctl --user reset-failed

```
