# Caddy Cloudflare + Layer 4 Image

A Docker image with Caddy built-in with the Cloudflare DNS and Layer 4 modules.

## Modules

- **[Cloudflare DNS](https://github.com/caddy-dns/cloudflare)** - DNS operations via Cloudflare
- **[Layer 4](https://github.com/mholt/caddy-l4)** - Layer 4 load balancing and protocol handling

## Quick Start

### Build
```bash
make build
```

### Test
```bash
make test
```

### Run
```bash
docker run -it --rm ghcr.io/username/caddy-cloudflare-layer4:2 caddy version
```

## Build Arguments

- `CADDY_VERSION` - Caddy version to build (default: `2`)

```bash
make build CADDY_VERSION=2.10.2
```

## Releases

Images are automatically built and pushed to GHCR on:
- Every push to `main`
- Daily at midnight UTC

Tags:
- `:2` - Latest stable Caddy 2.x
- `:2-<TIMESTAMP>` - Timestamped release for reproducibility

## Credits

* [caddy-l4](https://github.com/mholt/caddy-l4)
* [caddy-cloudflare](https://github.com/CaddyBuilds/caddy-cloudflare)
