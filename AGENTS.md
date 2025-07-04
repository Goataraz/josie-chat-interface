# Developer Instructions

This repo builds a Docker image for [text-generation-webui](https://github.com/oobabooga/text-generation-webui).
Follow these steps when maintaining or deploying the project.

## Prerequisites
1. Install **Docker** and **Docker Compose v2** before building the image.
   ```bash
   sudo apt-get update
   sudo apt-get install docker-compose-plugin
   ```
2. Ensure your user belongs to the `docker` group or prefix commands with `sudo`.

## Building the Docker image
- Run `docker compose build` whenever the Dockerfile or dependencies change.
  The image installs Git, Python 3, pip, and all Python requirements so it can
  run the web UI without additional setup.

## Running the container
- Start the service in the background with:
  ```bash
  docker compose up -d
  ```
- The service listens on **port 7860** and the compose file maps it to the same
  host port so you can access the web UI from your browser at
  `http://<host-ip>:7860`.

### External access
- To make the service reachable from outside your local network, forward port
  `7860` on your router or cloud firewall to the machine running Docker.

### Password protection
- Enable authentication by adding the `--gradio-auth` option to the command.
  You can override the default command in `docker-compose.yml` like so:
  ```yaml
  command: ["python3", "server.py", "--listen", "--port", "7860", "--gradio-auth", "user:pass"]
  ```
  Store credentials in environment variables if preferred.

### Start on reboot
- The compose file uses `restart: unless-stopped`, so containers come back
  automatically when Docker starts after a reboot.
- Make sure the Docker daemon starts at boot:
  ```bash
  sudo systemctl enable docker
  ```

Persistent data lives in the `data/` directory.
