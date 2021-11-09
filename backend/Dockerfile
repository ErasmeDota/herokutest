# ./Dockerfile

# Extend from the official Elixir image
FROM elixir:1.12.3

WORKDIR /app

RUN apt-get update && \
  apt-get install -y postgresql-client inotify-tools

# Create app directory and copy the Elixir projects into it
COPY . .

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get

RUN mix do compile
# Compile the project
RUN chmod +x ./entrypoint.sh
EXPOSE 5432

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]