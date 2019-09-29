FROM elixir:1.8.2-alpine

# RUN mix do local.hex --force, local.rebar --force

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN mix deps.get
RUN mix deps.compile

COPY . /app
RUN mix compile && cd -

EXPOSE 4000

CMD ["sh", "-c", "mix do local.hex --force, local.rebar --force, ecto.create, ecto.migrate; mix phx.server --no-halt"]