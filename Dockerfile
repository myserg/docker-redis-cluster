FROM redis:4.0.2

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -yqq net-tools supervisor ruby rubygems locales gettext-base wget && \
    apt-get clean -yqq

RUN gem install --no-document redis -v 3.3.3

RUN mkdir /redis
RUN mkdir /redis-conf
RUN mkdir /redis-data

RUN wget -O redis.tar.gz "$REDIS_DOWNLOAD_URL" && tar xfz redis.tar.gz -C /redis --strip-components=1

COPY ./redis-cluster.tmpl /redis-conf/redis-cluster.tmpl
COPY ./supervisord.conf /redis-conf/supervisord.conf

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["redis-cluster"]
