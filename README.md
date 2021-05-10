# Laravel Forge GitHub Action

Deploy your application to [Laravel Forge](https://forge.laravel.com) with GitHub Actions.

## Credit

Heavily based on [Glennmen/ploi-deploy-action](https://github.com/Glennmen/ploi-deploy-action).

## Inputs

It is highly recommended that you store all inputs using [GitHub Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets).

### `trigger_url`

When using the trigger url to deploy your application, this field is required. You can find this within your site's detail panel in Forge.

### `api_key`

If you want to use the API to deploy your application, you must provide `api_key`, `server_id` and `site_id`.

You can generate an API key in your [Forge dashboard](https://forge.laravel.com/user/profile#/api).

### `server_id`

You can find the ID of the server in the server's detail panel.

### `site_id`

You can find the ID of the site in the site's detail panel.

## Examples

### Deploy via Deployment Trigger URL

```yml
name: 'Deploy on push'

on:
  push:
    branches:
      - master

jobs:
  forge-deploy:
    name: 'Laravel Forge Deploy'
    runs-on: ubuntu-latest

    steps:
      # Checkout the repository to the GitHub Actions runner
      - name: Checkout
        uses: actions/checkout@v2

      # Trigger Laravel Forge Deploy
      - name: Deploy
        uses: jbrooksuk/laravel-forge-action@v1.0.0
        with:
          trigger_url: ${{ secrets.TRIGGER_URL }}
```

### Deploy via API

```yml
name: 'Deploy on push'

on:
  push:
    branches:
      - master

jobs:
  forge-deploy:
    name: 'Laravel Forge Deploy'
    runs-on: ubuntu-latest

    steps:
      # Checkout the repository to the GitHub Actions runner
      - name: Checkout
        uses: actions/checkout@v2

      # Trigger Laravel Forge Deploy
      - name: Deploy
        uses: jbrooksuk/laravel-forge-action@v1.0.0
        with:
          api_key: ${{ secrets.API_KEY }}
          server_id: 1
          site_id: 1
```
