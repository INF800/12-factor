#!/bin/bash
if [ -f .env ]; then
  source .env
fi

# Set PORT_FRONTEND to 5000 if it is not already set
PORT_FRONTEND=${PORT_FRONTEND:-5000}

python3.11 -m reflex run --loglevel debug

# # Check if the first argument is "--dev"
# if [ "$1" == "--dev" ]; then
#   python3.11 -m reflex run --loglevel debug
# else
#   python3.11 -m reflex run --env prod --loglevel debug
# fi