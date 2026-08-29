# Hyprland + Noctalia

### Failed unit started : dbus-_3a1.2-com.redhat.imsettings@0.service

`imsettings` is Fedora's legacy Input Method framework (for managing IBus, Fcitx, XIM, etc.). When logging into a standalone Wayland compositor like Hyprland, imsettings-daemon tries to start via D-Bus activation, fails because it expects a standard desktop environment session (GNOME/X11), and registers as a failed unit

```bash
systemctl --user mask "dbus-:1.2-com.redhat.imsettings@0.service"
systemctl --user mask imsettings-daemon.service
systemctl --user reset-failed

```

### Hyprland plugins
```bash
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm add https://github.com/horriblename/hyprgrass
hyprpm enable hyprbars hyprgrass
```

### ✖ Could not configure the hyprland source, cmake complained: 
Packages needed :
```
aquamarine-devel glslang-devel hyprcursor-devel hyprutils-devel hyprgraphics-devel libinput-devel
muParser-devel libeis-devel re2-devel hyprwayland-scanner-devel xcb-util-wm-devel xcb-util-errors-devel
hyprwire-devel readline-devel tomlplusplus-devel meson glibmm2.4-devel
```

### BUILD LUA 5.5 (Obselete when Fedora 45 or switch to Arch)
**DON'T DO THAT IT IS BROKEN**\
Build Lua5.5 : (God I hope it goes into the packages soon enough because this is painful)
```bash
# Build
curl -R -O https://www.lua.org/ftp/lua-5.5.0.tar.gz
tar -xf lua-5.5.0.tar.gz
cd lua-5.5.0
make linux
sudo make install

# Ensure the directory exists
sudo mkdir -p /usr/local/lib/pkgconfig /usr/share/pkgconfig

# Create the pkg-config definition
# YOU NEED TO MANUALLY ADD -fPIC IN THE BUILD FLAGS INSIDE THE REPO (good luck)
sudo tee /usr/share/pkgconfig/lua-5.5.pc > /dev/null << 'EOF'
prefix=/usr/local
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: Lua
Description: Lua language engine
Version: 5.5.0
Requires:
Libs: -L${libdir} -llua -lm -ldl
Cflags: -I${includedir}
EOF

# Create aliases for alternative naming formats CMake looks for
sudo ln -sf /usr/share/pkgconfig/lua-5.5.pc /usr/share/pkgconfig/lua5.5.pc
sudo ln -sf /usr/share/pkgconfig/lua-5.5.pc /usr/share/pkgconfig/lua55.pc

```

### Build Lua5.5 from fedora
```bash
sudo dnf install rpm-build rpmdevtools
# Find the Lua .src.rpm from the Fedora Koji Build System and rebuild it:
# https://koji.fedoraproject.org/koji/packageinfo?packageID=129
rpmbuild --rebuild lua-5.5.*.fc45.src.rpm
sudo dnf install ~/rpmbuild/RPMS/x86_64/<corresponding>
```

