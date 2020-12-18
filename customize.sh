#!/system/bin/sh
# Written by Draco (tytydraco @ GitHub)

ui_print "[*] Setting executable permissions..."
set_perm_recursive "$MODPATH/system/bin" root root 0777 0755
