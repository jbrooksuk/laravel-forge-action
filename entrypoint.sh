#!/bin/sh
set -e

deploy_with_webhook() {
    curl \
        --fail \
        --silent \
        --show-error \
        --user-agent "Forge-GitHubAction/1.0" \
        --max-time 5 \
        --connect-timeout 5 \
        --request 'POST' \
        "${TRIGGER_URL}"
}

deploy_with_api() {
    curl \
        --fail \
        --silent \
        --show-error \
        --user-agent "Forge-GitHubAction/1.0" \
        --max-time 5 \
        --connect-timeout 5 \
        --request 'POST' \
        -H "Authorization: Bearer ${API_KEY}" \
        -H "Content-Type: application/json" \
        -H "Accept: application/json" \
        "https://forge.laravel.com/api/v1/servers/${SERVER_ID}/sites/${SITE_ID}/deployment/deploy"
}

if [ -n "$TRIGGER_URL" ]; then
    deploy_with_webhook
elif [ -n "$API_KEY" ]; then
    if [ -z "$SERVER_ID" ] || [ -z "$SITE_ID" ]; then
        echo "SERVER_ID and SITE_ID environment variables must be set. Exiting."
        exit 1
    fi

    deploy_with_api
else
    echo "Either a TRIGGER_URL or API_KEY environment variable must be set to use the Laravel Forge GitHub Action. Exiting."
    exit 1
fi
