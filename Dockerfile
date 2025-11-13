FROM node:22-slim

WORKDIR /app

RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    apt update && apt install -y --no-install-recommends \
    dbus


COPY ./package*.json /app/
RUN npm ci
COPY . /app

CMD [ "npm", "test" ]
