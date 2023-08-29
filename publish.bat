@echo off
chcp 65001
:: set SERVER=vagrant@192.168.15.15
:: set AUTH_OPTIONS=-i  "D:\Software\IntelliJ IDEA 2023.2.1\private_key"
:: set DIR=/home/vagrant/docker-test

:: 服务器用户和ip
set SERVER=root@192.168.137.3
:: 授权选项,配置ssh免密登录后可为空
set AUTH_OPTIONS=
:: 项目根目录
set DIR=/root/docker-test
:: 容器名称
set CONTAINER_NAME=docker-test
:: 镜像名称
set IMAGE_NAME=wtfwyy/docker-test
:: 容器运行选项
set OPTIONS=-p 8086:8086
:: jar包名称
set JAR_NAME=docker-0.0.1-SNAPSHOT.jar

if NOT "%DIR%"=="" (
  ssh %AUTH_OPTIONS% %SERVER% mkdir -p %DIR%
)
call mvn clean package -Dmaven.test.skip=true
ssh %AUTH_OPTIONS% %SERVER% docker stop %CONTAINER_NAME% || true
ssh %AUTH_OPTIONS% %SERVER% docker rm %CONTAINER_NAME% || true
ssh %AUTH_OPTIONS% %SERVER% docker rmi %IMAGE_NAME% || true
scp %AUTH_OPTIONS% ./Dockerfile %SERVER%:%DIR%
scp %AUTH_OPTIONS% ./docker-entrypoint.sh %SERVER%:%DIR%
scp -r %AUTH_OPTIONS% ./target/%JAR_NAME% %SERVER%:%DIR%/app.jar
ssh %AUTH_OPTIONS% %SERVER% "cd %DIR% && docker build -t %IMAGE_NAME% . && docker run -d %OPTIONS% --name %CONTAINER_NAME% %IMAGE_NAME%"



