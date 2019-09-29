FROM elixir:1.8.2-alpine

WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force

COPY mix.exs .
COPY mix.lock .

RUN mix deps.get
RUN mix deps.compile

COPY . /app
RUN mix compile && cd -

EXPOSE 4000

CMD ["sh", "-c", "ecto.create, ecto.migrate; mix phx.server --no-halt"]