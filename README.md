## Springboot项目一键部署docker脚本

### 使用方法

1. 拷贝以下文件到项目根目录中
```
docker-entrypoint.sh
Dockerfile
publish.bat
```
2. 修改publish.bat中相应参数
3. 修改docker-entrypoint.sh中相应参数(可选)
4. 执行publish.bat




## 其它

### windows ssh免密登录到服务器配置

1. 在`powershell`中执行`ssh-keygen`,一路回车
```
PS C:\WINDOWS\system32> ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (C:\Users\86187/.ssh/id_rsa):
```
2. 将生成的C:\Users\{用户}\.ssh\id_rsa.pub(改个名字,如: `id_rsa_win.pub`)文件复制到服务器上`/root/.ssh`下
  > 方法一: 使用ftp软件上传
  > 方法二: 使用scp id_rsa.pub user@ip/root/.ssh
  > 方法三: 在服务器上执行`yum -y install lrzsz`,然后使用`rz`命令上传
3. 在服务器/root/.ssh下执行`cat id_rsa_win.pub >>authorized_keys`

4. 完成