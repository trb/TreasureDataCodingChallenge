#!/bin/bash

# delete old pid in case it's still around for some reason
rm -f /app/tmp/pids/server.pid
cd /app
bundle exec rails server -b 0.0.0.0 -p 5000
