FROM haugene/transmission-openvpn:latest

VOLUME [ "/config" ]
VOLUME [ "/data/transmission-home" ]
VOLUME [ "/data/completed" ]
VOLUME [ "/data/incomplete" ]
VOLUME [ "/data/watch" ]

WORKDIR /usr/share/transmission/web

RUN mv index.html index.original.html

COPY ./src/transmission_web_control/ .

RUN chmod 777 -R *

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 CMD curl --fail http://localhost:9091 || exit 1
