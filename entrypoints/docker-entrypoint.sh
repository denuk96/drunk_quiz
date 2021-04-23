#!/bin/sh
# Exit on fail
set -e

rm -f app/tmp/pids/server.pid
rm -f app/tmp/pids/sidekiq.pid

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec bundle install

exec "$@"