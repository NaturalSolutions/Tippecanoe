# NS Docker: Tippecanoe

This is a Docker image for [Mapbox's Tippecanoe](https://github.com/mapbox/tippecanoe), based on Alpine Linux.

## Usage

Run with `docker run`, mounting a local directory or use Docker volumes as needed with `-v`. See below for specific examples.

## Intertative mode with `bash`

Bash comes preinstalled and will run as the default entrypoint.

```bash
docker run --rm -it -v data:/home/tippecanoe registry.gitlab.com/natural-solutions/tippecanoe:latest
bash-5.0$ tippecanoe --help
```

The optional `--rm` flag removes the container filesystem on completion to prevent cruft build-up. See: https://docs.docker.com/engine/reference/run/#clean-up---rm