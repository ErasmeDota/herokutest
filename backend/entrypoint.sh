# entrypoint.sh

#!/bin/bash
# Docker entrypoint script.

# Wait until Postgres is ready
echo $PGHOST
echo $PGUSER
echo $PGPASSWORD
while ! pg_isready -q -h $PGHOSTNAME -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Create, migrate, and seed database if it doesn't exist.
if [ -z `psql -Atqc "\\list $PGDATABASE"` ]; then
  echo "Database $PGDATABASE does not exist. Creating..."
  createdb -E UTF8 $PGDATABASE -l en_US.UTF-8 -T template0
  mix ecto.migrate
  mix run priv/repo/seeds.exs
  echo "Database $PGDATABASE created."
fi

mix ecto.migrate
exec mix phx.server