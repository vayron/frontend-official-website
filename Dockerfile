# Dockerfile
FROM node:19.6.1
RUN mkdir -p /app
COPY . /app
WORKDIR /app

# 容器对外暴露的端口号，要和node项目配置的端口号一致
ENV HOST 0.0.0.0
EXPOSE 3000

#RUN git pull
RUN npm config set registry https://mirrors.cloud.tencent.com/npm/

RUN npm install
RUN npm run build
RUN npm i pm2 -g
RUN pm2 install pm2-logrotate
RUN pm2 set pm2-logrotate:retain 15 && \
    pm2 set pm2-logrotate:max_size 300M && \
    pm2 set pm2-logrotate:compress true && \
    pm2 set pm2-logrotate:dateFormat YYYY-MM-DD

# CMD [ "npm", "start" ]
CMD ["pm2-runtime", "start", "ecosystem.config.js"]