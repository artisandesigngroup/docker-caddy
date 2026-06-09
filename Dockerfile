FROM caddy:2.11.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/corazawaf/coraza-caddy/v2 \
    --with github.com/WeidiDeng/caddy-cloudflare-ip@f53b62aa13cb7ad79c8b47aacc3f2f03989b67e5

FROM caddy:2.10.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
