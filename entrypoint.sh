#!/bin/sh
set -e

if [ -z "$WEBHOOK_URL" ]; then
    echo "WEBHOOK_URL environment variable is not set, exiting..."
    exit 1
fi

curl \
    --fail \
    --silent \
    --show-error \
    --max-time 5 \
    --connect-timeout 5 \
    --request 'POST' \
    "$WEBHOOK_URL"