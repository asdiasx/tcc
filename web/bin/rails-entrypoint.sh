#!/usr/bin/env sh
echo "Executing rails-entrypoint ..."
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

./bin/dev