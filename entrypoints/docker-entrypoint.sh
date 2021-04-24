#!/bin/sh
# Exit on fail
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi
if [ -f tmp/pids/sidekiq.pid ]; then
  rm tmp/pids/sidekiq.pid
fi

#rm -f app/tmp/pids/sidekiq.pid

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec bundle install

exec "$@"