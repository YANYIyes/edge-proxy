# edge-proxy

VLESS over WebSocket, containerized.

## Deploy
- Build from this repository Dockerfile
- Env: UUID=<uuid>, WS_PATH=/ws (optional), PORT provided by platform
- Client: vless + ws + tls, port 443, path /ws
