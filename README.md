### 在服务器启动项目
bash start.sh

### 本地调试
npm run dev

### 构建服务
npm run build

### 启动服务
npm run start

### 构建静态代码
npm run generate

### 本地开发
npm install 
npm dev




### 远程启动
git pull
bash start.sh

### docker
docker build -t deepturing:latest .
docker run -d -p 3002:3002 deepturing:latest

cd /data/docker/nginx/frontend-official-website
docker build -t visionstory:latest .
cd ~/tim/opscripts/docker &&  bash run_visionstory.sh

docker images 

docker stop 

docker rmi 

docker ps -a

### 登录账号
docker login --username=tbh124474936x0dxp@aliyun.com registry.cn-hangzhou.aliyuncs.com

### 本地打包镜像

docker tag 93cba2deccd2 registry.cn-hangzhou.aliyuncs.com/vayron/deepturing:latest

### 镜像推送
docker push registry.cn-hangzhou.aliyuncs.com/vayron/deepturing:20221111-1

### 镜像拉取
docker pull registry.cn-hangzhou.aliyuncs.com/vayron/deepturing:20221111-1

docker run -t -i registry.cn-hangzhou.aliyuncs.com/vayron/deepturing:0.0.1 /bin/bash 

docker stop c656d2ae99dc && docker run -d -p 3002:3002 registry.cn-hangzhou.aliyuncs.com/vayron/deepturing:20221111-1
