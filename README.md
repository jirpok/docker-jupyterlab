A simple Docker Compose configuration for running JupyterLab with support for other programming languages besides Python: C, Kotlin, Bash, Zsh, and JavaScript.

### Setup

1. Update `existing-docker-network`, `/path/to/jupyter/notebooks` (your notebooks), and `/path/to/jupyter/configuration` (JupyterLab web UI settings) in `docker-compose.yml` accordingly. You can leave both directories initially empty.
2. Run `docker compose up -d --build`.

### Notes

- For rootless Docker, change ownership of the configuration directory on the host to `100999:100099` (it's _not_ a typo).
- Install additional Python packages by adding them to the `# install Python packages` section of the Dockerfile, then rebuild.
- The default port is `8888`.
