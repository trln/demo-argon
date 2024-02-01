#!/bin/sh

set -e

bundle_check() {
    bundle check || bundle install
}

case $1 in
    start) 
        bundle_check
        bundle config unset deployment
        rm -f tmp/pids/server.pid
        exec bundle exec rails server -b 0.0.0.0
        ;;
    start-production)
        bundle config set deployment true
        export RAILS_ENV=production
        export RAILS_SERVE_STATIC_FILES=true
        export ALLOW_LOCALHOST=true
        bundle check
        bundle exec rails assets:precompile
        exec bundle exec rails server -e production -b 0.0.0.0
        ;;
    test)
        bundle check
        exec bundle exec rails test
        ;;
    update)
        bundle config unset deployment
        exec bundle update
        ;;
    console)
        bundle_check
        exec bundle exec rails console
        ;;
    shell)
        exec /bin/bash
        ;;
    *)
        exec $@
        ;;
esac
