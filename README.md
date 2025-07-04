# Text Generation Web UI Docker Setup

This project provides a simple `Dockerfile` and `docker-compose.yml` for running
[Oobabooga's text-generation-webui](https://github.com/oobabooga/text-generation-webui)
in a container. The service listens on **port 7860** and is reachable from outside your network if the port is forwarded on your router or cloud firewall.

## Prerequisites

1. [Install Docker](https://docs.docker.com/get-docker/)
2. [Install Docker Compose](https://docs.docker.com/compose/install/)

On Ubuntu you can install Docker Compose v2 with:

```bash
sudo apt-get update
sudo apt-get install docker-compose-plugin
```

Make sure your user is in the `docker` group or prepend commands with `sudo`.

## Usage

Clone this repository and run:

```bash
docker compose up -d --build
```

The web UI will be available at `http://localhost:7860`. To connect from outside
your network, ensure port `7860` is open and forwarded to the host running Docker.

All persistent data (models, logs, etc.) are stored in the `data/` directory.

### Accessing External and Local APIs

The container uses the default Docker bridge network, allowing it to reach both
external services on the internet and other containers or hosts on your local
network. No extra configuration is required, but you can customize the network
settings in `docker-compose.yml` if needed.
