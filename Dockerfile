FROM scratch

COPY --from=nginx:mainline-alpine / /

RUN apk add --no-cache curl

LABEL traefik.enable=true
LABEL traefik.backend=pastebin
LABEL traefik.frontend.rule=Host:paste.robbast.nl,p.robbast.nl
LABEL traefik.port=8000

WORKDIR /srv

COPY nginx.conf /etc/nginx/nginx.conf

RUN touch /var/run/nginx.pid \
 && mkdir -p /var/cache/nginx/client_temp \
 && chown -R nginx /srv /var/cache/nginx /var/run/nginx.pid \
 && find /srv -type d -exec chmod 700 {} \+ \
 && find /srv -type f -exec chmod 600 {} \+

STOPSIGNAL SIGTERM

EXPOSE 80/tcp

USER root

CMD ["nginx", "-g", "daemon off;"]
