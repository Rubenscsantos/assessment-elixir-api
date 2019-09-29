FROM elixir:1.8.2-alpine


# Installing Elixir Dependencies
## Options for non-interactive mix
RUN mix local.hex --force
RUN mix local.rebar --force

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN mix deps.get
RUN mix deps.compile

COPY . /app

RUN mix compile

EXPOSE 4000

CMD ["sh", "-c", "mix do local.hex --force, ecto.create, ecto.migrate; mix phx.server --no-halt"]