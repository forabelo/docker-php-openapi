FROM composer

# Add the required tokenizer exention which is required for token_get_all in this swagger tool
RUN apk add --no-cache php8-tokenizer

RUN composer global require zircote/swagger-php

ENV PATH="${COMPOSER_HOME}/vendor/bin:$PATH"

WORKDIR /app
COPY composer.json /app/composer.json
RUN composer install
RUN composer du
RUN echo '#!/usr/bin/env '"$COMPOSER_HOME"'/vendor/zircote/swagger-php/bin/openapi' > /docker-entrypoint.sh
