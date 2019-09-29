FROM elixir:1.8.2-alpine


RUN apk add --update --no-cache ca-certificates make tzdata git nodejs nodejs-npm inotify-tools

# Installing Elixir Dependencies
## Options for non-interactive mix
RUN mix local.hex --force && \
  mix local.rebar --force

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN mix deps.get
RUN mix deps.compile

COPY . /app

RUN mix compile \
  && assets \
  && npm install \
  && chmod -R 0777 node_modules \
  && cd -

EXPOSE 4000

CMD ["sh", "-c", "mix do local.hex --force, ecto.create, ecto.migrate; mix phx.server --no-halt"]