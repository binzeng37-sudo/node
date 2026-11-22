#!/bin/sh
PORT=${PORT:-8080}
UUID=${UUID:-6178eef8-08d8-4068-9710-577e5e1f6cde}
WSPATH=${WSPATH:-/e7b4a612}
cat > /app/config.json <<EOF
{"log":{"loglevel":"warning"},"inbounds":[{"port":$PORT,"protocol":"vless","settings":{"clients":[{"id":"$UUID"}],"decryption":"none"},"streamSettings":{"network":"ws","wsSettings":{"path":"$WSPATH"}}}],"outbounds":[{"protocol":"freedom"}]}
EOF
exec /app/xray run -c /app/config.json
