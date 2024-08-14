FROM alpine:3.20.1

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

COPY php-fpm_exporter /

# Non-root user
USER 101

EXPOSE     9253
ENTRYPOINT [ "/php-fpm_exporter", "server" ]

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="php-fpm_exporter" \
      org.label-schema.description="A prometheus exporter for PHP-FPM." \
      org.label-schema.url="https://github.com/ministryofjustice" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ministryofjustice/php-fpm_exporter" \
      org.label-schema.vendor="ministryofjustice" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0" \
      org.label-schema.docker.cmd="docker run -it --rm -e PHP_FPM_SCRAPE_URI=\"tcp://127.0.0.1:9000/status\" ministryofjustice/php-fpm_exporter"
