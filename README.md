# deploy-that

A github action to deploy your code to a webpage

## Usage

See [action.yml](./action.yml) for the options

```yaml
# Simple workflow for deploying static content to GitHub Pages
name: Deploy static content to Pages

on:
  # Runs on pushes targeting the default branch
  push:
    branches: ["main"]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow one concurrent deployment
concurrency:
  group: "pages"
  cancel-in-progress: true

jobs:
  # Single deploy job since we're just deploying
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: its-just-nans/deploy-that@latest
```

## Used by

- <https://github.com/Its-Just-Nans/domains>
- <https://github.com/Its-Just-Nans/Its-Just-Nans.github.io>
- <https://github.com/Its-Just-Nans/yakb>
- <https://github.com/Its-Just-Nans/golb>
