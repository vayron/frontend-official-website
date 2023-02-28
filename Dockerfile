# Dockerfile
FROM node:19.6.1
RUN mkdir -p /app
COPY . /app
WORKDIR /app

# 容器对外暴露的端口号，要和node项目配置的端口号一致
ENV HOST 0.0.0.0
EXPOSE 3000

#RUN git pull
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install
RUN npm run build 
RUN cp -rf .output/public/offical-website/ ../cdn/www

CMD [ "npm", "start" ]


