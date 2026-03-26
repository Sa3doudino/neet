#!/bin/bash

# تنظيف الـ VNC servers القديمة
vncserver -kill :1 &> /dev/null || true

# تشغيل VNC server
vncserver :1 -geometry 1280x800 -depth 24 -localhost no &> /dev/null
sleep 5s

# تشغيل noVNC
websockify --web /usr/share/novnc/ 6080 localhost:5901 &
echo "noVNC running on port 6080"

# خلي السكريبت مكملش باش الحاوية تبقى حية
wait
