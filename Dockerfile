FROM python:3.11-slim

RUN apt-get -y update && apt-get -y upgrade 
RUN apt-get install --reinstall unzip
RUN apt-get -y install curl
RUN apt-get clean

WORKDIR /srv

COPY . app

RUN python3.11 -m pip install -r ./app/requirements.txt

RUN chmod +x /srv/app/entrypoint.sh

CMD ["/bin/bash", "-c", "cd /srv/app && ./entrypoint.sh --dev"]