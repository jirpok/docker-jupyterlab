## What is this?

Run [JupyterLab](https://jupyterlab.readthedocs.io/en/latest/) with Docker Compose, with integrated support for other languages: C, Kotlin, Bash, and JavaScript.

## Who is it for?

Anyone trying to understand how to install alternative kernels in order ot get support for programming languages other than Python in JupyterLab.

## Setup

1. Edit `docker-compose.yml` and replace:
   - `existing-docker-network`
   - `/path/to/jupyter/notebooks`: A directory with your `.ipynb` notebooks, typically a Git repo. Its root will show up in the sidebar.[^1]
   - `/path/to/jupyter/configuration`: Settings and cache. For rootless Docker, change this directory's ownership on the host to `100999:100099` (it's _not_ a typo).[^1]

2. Run `docker compose up -d --build`.

3. The default port is `8888`.

4. Install additional Python packages by adding them to the `# install Python packages` section of the Dockerfile, then rebuild.

## Make password persistent across server sessions

1. Run `docker logs jupyter` and copy the token.
2. Fill in the form, including your new password.
3. Follow the instructions in `/path/to/jupyter/configuration/jupyter_server_config.py:c.ServerApp.password`; ignore DEPRECATED warnings.

[^1]: Both directories can be initially empty.
