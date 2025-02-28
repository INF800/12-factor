FROM python:3.11

WORKDIR /srv

COPY ./ app/

RUN python3.11 -m pip install -r ./app/requirements.txt

RUN chmod +x /srv/app/entrypoint.sh

CMD ["/bin/bash", "-c", "cd /srv/app && ./entrypoint.sh"]