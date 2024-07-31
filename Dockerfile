FROM docker.n8n.io/n8nio/n8n

USER root
RUN addgroup -S docker && addgroup -S node docker && apk add docker-cli runuser && rm /docker-entrypoint.sh
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chown root:root /docker-entrypoint.sh && chmod 744 /docker-entrypoint.sh