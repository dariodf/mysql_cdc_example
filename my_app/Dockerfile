FROM elixir:1.14

# Create working directory
RUN mkdir /app
WORKDIR /app

# Copy Elixir project files
COPY mix.* ./
COPY config/* ./config/
RUN mix local.hex --force -y
RUN mix local.rebar --force -y
RUN mix deps.get

# Copy remaining application files
COPY . .

# Compile application
RUN mix compile

CMD ["mix", "run"]
