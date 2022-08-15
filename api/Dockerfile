FROM ruby

RUN apt-get update -qq && apt-get install -y postgresql-client

USER root

COPY src/bin/entrypoint.sh /home/rails/entrypoint.sh
COPY src/ /app

WORKDIR /app
VOLUME ["/app"]
VOLUME ["/gems"]
EXPOSE 5000

ENTRYPOINT ["/home/rails/entrypoint.sh"]
