FROM node:lts-buster

RUN apt-get update && \
    apt-get install -y ffmpeg webp git && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/0srD4n/DanBot Dantca

WORKDIR /Dantca

RUN yarn install --production

RUN yarn global add pm2

CMD ["pm2-runtime", "npm", "--", "start"]
