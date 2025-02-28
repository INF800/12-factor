FROM python:3.11-slim


# System tools
RUN apt-get -y update && apt-get -y upgrade 
RUN apt-get install --reinstall unzip
RUN apt-get -y install git
RUN apt-get -y install curl


# Installing Node using NVM
# https://stackoverflow.com/questions/25899912/how-to-install-nvm-in-docker/60137919#60137919
ENV NODE_VERSION="22.14.0"
SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
RUN source /root/.bashrc && nvm install $NODE_VERSION
SHELL ["/bin/bash", "--login", "-c"]


# Install bun
# https://stackoverflow.com/questions/25899912/how-to-install-nvm-in-docker/60137919#60137919
SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -fsSL https://bun.sh/install | bash
RUN source /root/.bashrc && bun --version
SHELL ["/bin/bash", "--login", "-c"]


# Delete package files
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean


# https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/srv.html
WORKDIR /srv

COPY ./ app/

RUN python3.11 -m pip install -r ./app/requirements.txt

RUN chmod +x /srv/app/entrypoint.sh

CMD ["/bin/bash", "-c", "cd /srv/app && ./entrypoint.sh"]