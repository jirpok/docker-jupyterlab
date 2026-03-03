FROM quay.io/jupyter/base-notebook:latest

USER root

# install kernel dependencies
RUN apt-get update && apt-get install -y \
    # Kotlin, C, Deno
    openjdk-17-jdk gcc curl unzip \
    && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# install Python packages
RUN pip install \
    jupyter-c-kernel \
    bash-kernel \
    zsh-jupyter-kernel \
    kotlin-jupyter-kernel

RUN curl -fsSL https://deno.land/install.sh | sh

# install kernels
RUN python -m bash_kernel.install --sys-prefix \
    && python -m zsh_jupyter_kernel.install --sys-prefix \
    && install_c_kernel --sys-prefix \
    && /home/jovyan/.deno/bin/deno jupyter --install
