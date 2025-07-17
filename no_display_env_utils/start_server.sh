#!/usr/bin/env bash

# 1) start Xvfb in the background
Xvfb :1 -screen 0 1280x720x16 -ac 2>/dev/null &
export DISPLAY=:1
fluxbox 2>/dev/null &

# ── wait for Xvfb to answer on DISPLAY :1 ──────────────────────────────────
echo -n "Waiting for Xvfb on ${DISPLAY}"
until xdpyinfo -display "${DISPLAY}" >/dev/null 2>&1; do
  sleep 0.1
  echo -n "."
done
echo " ready!"

# 2) now start the VNC server
x11vnc -display :1 -nopw -forever -shared -bg -rfbport 5901

# ── wait until x11vnc has bound port 5901 ────────────────────────────────
echo -n "Waiting for VNC port 5901"
until ss -ltn | grep -q ":5901 "; do
  sleep 0.1
  echo -n "."
done
echo " ready!"

# 3) clean up any old websockify and start noVNC
pgrep -f "websockify .* 6080" | xargs -r kill -9
pgrep -f "/bin/bash .* 6080"  | xargs -r kill -9
sleep 0.5

cd ~/noVNC
./utils/websockify/run 6080 --web ~/noVNC localhost:5901 &
echo "✔ GUI ready → http://<server-ip>:6080/vnc.html"