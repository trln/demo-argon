# Demo Argon

Deploys via capistrano.  This is a rails application that followed the instructions from the `trln_argon` repository.

## Developing With podman

A `Dockerfile` along with an `entrypoint.sh` and `start` script are provided.
Build with 

    $ podman build . -t demo-argon:latest


and run with 

    $ ./start

This will run Rails in development mode.

To run in production mode,

   $ ./start start-production

Which will run assets:precompile and set the server up to serve static files
and allow connections from localhost.

