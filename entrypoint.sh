#!/bin/sh
set -e
if [ -z "$UUID" ]; then echo "missing UUID" >&2; exit 1; fi
[ -z "$PORT" ] && PORT=8080
[ -z "$WS_PATH" ] && WS_PATH=/ws
cat > /tmp/config.json <<EOF
{
  "log": { "loglevel": "warning" },
  "inbounds": [{
    "listen": "0.0.0.0",
    "port": $PORT,
    "protocol": "vless",
    "settings": { "clients": [ { "id": "$UUID" } ], "decryption": "none" },
    "streamSettings": { "network": "ws", "security": "none", "wsSettings": { "path": "$WS_PATH" } },
    "sniffing": { "enabled": true, "destOverride": ["http","tls","quic"] }
  }],
  "outbounds": [ { "protocol": "freedom" } ]
}
EOF
echo "listening 0.0.0.0:$PORT path=$WS_PATH"
exec /usr/local/bin/xray run -c /tmp/config.json
