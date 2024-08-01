Hesk是一个简单的、用户友好的自助服务门户，有一个集中的支持系统，允许你组织、优先处理和跟踪票据的紧迫性、类别和当前状态。它以其强大的客户支持帮助办公桌软件，为您在短时间内发展公司提供服务。此外，它是一个快速和安全的平台，支持创建知识系统，以减少几个支持请求，通过给终端客户的访问。它有效地管理自定义数据字段、状态、资产管理、预制回复、员工账户和分析。

官方网址：https://www.hesk.com/

原作者项目：https://github.com/luketainton/hesk-docker.git

在原基础上增加制作x86与arm版本，

docker运行：需要自定义MySQL/MariaDB数据库：
```
docker run -d -p 8880:80  solyhe84/hesk
```

或使用：docker-compose

```
services:
  heskdb:
    image: mariadb
    volumes:
      - ./db_data:/var/lib/mysql
    restart: always
    environment:
      TZ: Asia/Shanghai
      MARIADB_ROOT_PASSWORD: abc123..
      MARIADB_DATABASE: hesk
      MARIADB_USER: hesk
      # Please change the password before deploying.
      MARIADB_PASSWORD: hesk
    
  heskweb:
    depends_on:
      - heskdb
    image: solyhe84/hesk
    volumes:
        - ./www:/srv  #Hesk文件目录可映射到寄主机
        - ./log:/var/log/apache2   #日志文件
    ports:
      - "8880:80"
    environment:
      - TZ=Asia/Shanghai
    restart: always
```

安装：http://ip:port/install

注意这里数据库主机为：heskdb
