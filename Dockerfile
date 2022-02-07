FROM node

RUN apt update && apt install -y wget

RUN mkdir /app && chown node:node /app

WORKDIR /app

USER node

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

COPY scripts/main.sh /tmp/main.sh

CMD bash /tmp/main.sh