# netbox-container

Custom NetBox container image with pre-installed plugins, automatically rebuilt whenever a new NetBox release is published.

## Overview

This repository builds a Docker image based on the official [`ghcr.io/netbox-community/netbox`](https://github.com/netbox-community/netbox) image with additional plugins installed at build time.

A GitHub Actions workflow runs daily to detect new NetBox releases and automatically builds and pushes a matching image to the GitHub Container Registry (GHCR).

## Included Plugins

| Plugin | Description |
|--------|-------------|
| [netbox-bgp](https://github.com/netbox-community/netbox-bgp) | BGP peer and session management |
| [netbox-topology-views](https://github.com/netbox-community/netbox-topology-views) | Network topology visualization |

To add or remove plugins, edit [`plugin_requirements.txt`](./plugin_requirements.txt) and [`configuration/plugins.py`](./configuration/plugins.py).

## Usage

### Pull the latest image

```bash
docker pull ghcr.io/<owner>/netbox-container:latest
```

### Pull a specific version

```bash
docker pull ghcr.io/<owner>/netbox-container:v4.2.0
```

## Customizing Plugins

1. Add plugin package names to `plugin_requirements.txt`
2. Register the plugin and its configuration in `configuration/plugins.py`
3. Commit and push — the next scheduled build will include the changes, or trigger a manual build via the **Actions** tab

## Manual Build

To trigger a build for a specific NetBox version, go to **Actions → Build and Push NetBox Container Image with Plugins → Run workflow** and optionally supply a version (e.g., `v4.2.0`). Leave the version field empty to build the latest release.

## Automated Updates

The [`build.yml`](./.github/workflows/build.yml) workflow runs every day at midnight UTC. It:

1. Fetches the latest NetBox release tag from the GitHub API
2. Checks whether an image with that tag already exists in GHCR
3. If not, builds the custom image and pushes it with both a version tag (e.g., `v4.2.0`) and `latest`
