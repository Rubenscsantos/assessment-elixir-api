FROM elixir:1.8.2-alpine

RUN mix local.hex --force && \ 
  mix local.rebar --force

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN mix deps.get
RUN mix deps.compile

COPY . /app
RUN mix compile && cd -

CMD ["sh", "-c", "mix do ecto.create, ecto.migrate; mix phx.server --no-halt"]