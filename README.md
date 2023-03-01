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


### pm2
pm2 list                      # 列表 PM2 启动的所有的应用程序
pm2 monit                     # 显示每个应用程序的CPU和内存占用情况
pm2 show [app-name]           # 显示应用程序的所有信息
pm2 logs                      # 显示所有应用程序的日志
pm2 logs [app-name]           # 显示指定应用程序的日志
pm2 flush                     # 清空所有日志文件
pm2 stop all                  # 停止所有的应用程
pm2 stop 0                    # 停止 id为 0的指定应用程序
pm2 restart all               # 重启所有应用
pm2 reload all                # 重启 cluster mode下的所有应用
pm2 delete all                # 关闭并删除所有应用
pm2 delete 0                  # 删除指定应用 id 0
pm2 startup                   # 创建开机自启动命令
pm2 save                      # 保存当前应用列表


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
