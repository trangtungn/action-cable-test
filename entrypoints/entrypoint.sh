#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Runs setup if database does not exist, or runs migrations if it does
bundle exec rake db:prepare 

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
