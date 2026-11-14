FROM alpine:3.21
RUN apk add --no-cache curl unzip ca-certificates tzdata
RUN curl -fsSL -o /tmp/x.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
 && unzip -o /tmp/x.zip -d /usr/local/bin xray geoip.dat geosite.dat \
 && chmod +x /usr/local/bin/xray && rm -rf /tmp/x.zip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
