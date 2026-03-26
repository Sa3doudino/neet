FROM ubuntu:focal
RUN apt-get update && apt-get install -y \
    xorg \
    fluxbox \
    vnc4server \
    chromium-browser \
    websockify \
    novnc

# تعطيل التسريع فكروم
RUN sed -i 's/^Exec=.*/Exec=chromium-browser --disable-gpu/' /usr/share/applications/chromium-browser.desktop

# تشغيل السكريبت
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
