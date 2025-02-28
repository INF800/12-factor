#!/bin/bash
if [ -f .env ]; then
  source .env
fi

# Check if the first argument is "--dev"
if [ "$1" == "--dev" ]; then
  python3.11 -m reflex run
else
  python3.11 -m reflex run --env prod
fi