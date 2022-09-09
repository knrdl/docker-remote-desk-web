FROM alpine

RUN apk update && \
    apk add xpra xpra-webclient xterm py3-cairo py3-netifaces xauth firefox py3-opengl py3-rencode py3-lz4 py3-uinput font-noto py3-pillow py3-xdg py3-inotify && \
    adduser --gecos "" --shell /sbin/nologin --disabled-password desktop

EXPOSE 8080/tcp

USER desktop

CMD xpra start :100 --systemd-run=no --mdns=no --bind-tcp=0.0.0.0:8080 --daemon=no --html=on --start=firefox --start=xterm --notifications=no --pulseaudio=no --webcam=no

