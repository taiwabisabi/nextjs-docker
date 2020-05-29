FROM node:12-alpine

ENV YARN_CACHE_FOLDER /yarn

WORKDIR /srv/app
VOLUME /srv/app

RUN mkdir -p $YARN_CACHE_FOLDER

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["yarn", "dev"]