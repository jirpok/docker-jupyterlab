Custom Docker Compose setup for [JupyterLab](https://jupyterlab.readthedocs.io/en/latest/) with preconfigured kernels for Bash, C, Kotlin, Python and JavaScript for multi-language notebook development

### Setup

1. Update the following in `docker-compose.yml`:
    - `existing-docker-network`
    - `/path/to/your/jupyter/notebooks`[^1]
    - `/path/to/your/jupyter/configuration`[^1]: Settings and cache. For rootless Docker, change ownership on the host to `100999:100099` (it's _not_ a typo).
2. Run `docker compose up -d --build`
3. The default port is `8888`

To make password persistent across server sessions:

1. Run `docker logs jupyter` and copy the token
2. Fill out the form and set your new password
3. Follow the instructions in `/path/to/jupyter/configuration/jupyter_server_config.py:c.ServerApp.password` (ignore the deprecation warnings)

To install additional Python packages, add them to the `# install Python packages` section of the `Dockerfile`, then rebuild the image

[^1]: Both directories can be initially empty
