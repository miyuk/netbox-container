# netbox-container

Custom NetBox container image with pre-installed plugins, automatically rebuilt whenever a new NetBox release is published.

## Overview

This repository builds a Docker image based on the official [`ghcr.io/netbox-community/netbox`](https://github.com/netbox-community/netbox) image with additional plugins installed at build time.

A GitHub Actions workflow runs daily to detect new NetBox releases and automatically builds and pushes a matching image to the GitHub Container Registry (GHCR).

## Current Dependencies

| Dependency | Source |
|------------|--------|
| Base image | [`ghcr.io/netbox-community/netbox:${NETBOX_VERSION}`](https://github.com/netbox-community/netbox/pkgs/container/netbox) |
| Plugin list | [`plugin_requirements.txt`](./plugin_requirements.txt) |

### Included Plugins

| Plugin | Description |
|--------|-------------|
| [netboxlabs-netbox-custom-objects](https://github.com/netboxlabs/netbox-custom-objects) | Custom object management for NetBox |
| [netbox-security](https://github.com/netbox-community/netbox-security) | Security-related NetBox extensions |
| [netbox-topology-views](https://github.com/netbox-community/netbox-topology-views) | Network topology visualization |
| [netbox-plugin-dns](https://github.com/peteeckel/netbox-plugin-dns) | DNS management plugin |
| [netboxlabs-netbox-branching](https://github.com/netboxlabs/netbox-branching) | Branching workflows for NetBox data |

To add or remove plugins, edit [`plugin_requirements.txt`](./plugin_requirements.txt).

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

1. Add or remove plugin package names in `plugin_requirements.txt`
2. Commit and push — the next scheduled build will include the changes, or trigger a manual build via the **Actions** tab

## Manual Build

To trigger a build for a specific NetBox version, go to **Actions → Build and Push NetBox Container Image with Plugins → Run workflow** and optionally supply a version (e.g., `v4.2.0`). Leave the version field empty to build the latest release.

If you changed only plugins or other repository contents and still want to republish the image for an existing NetBox tag, enable **Force rebuild** when running the workflow manually.

## Automated Updates

The [`build.yml`](./.github/workflows/build.yml) workflow runs weekly on Monday at midnight UTC. It:

1. Fetches the latest NetBox release tag from the GitHub API
2. Checks whether an image with that tag already exists in GHCR
3. If not, builds the custom image and pushes it with both a version tag (e.g., `v4.2.0`) and `latest`
