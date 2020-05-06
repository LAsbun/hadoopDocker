配置
----- 
|节点|HDFS|YARN|
|---|---|---|
|001|NodeManager，DataNode|NameNode|
|002|DataNode|ResourceManager|
|003|SecondaryNameNode，DataNode|NameNode|

- 其他配置都写在配置文件中了

编译部署
---
- 本地按照顺序编译
  - dockerCentos
    - 运行命令`docker build -t lasbun/centos7 .`
  - c7-ssh
    - 运行命令`docker build -t lasbun/c7-ssh:0.0.1 .`
  - hadoop2.7
    - 这个本地编译的时候需要先下载`jdk-8u131-linux-x64.tar.gz` && `hadoop-2.7.2.tar.gz` 到hadoop2.7/ 子目录下
    - 运行命令`docker build -t lasbun/hadoop2.7.2:0.0.1 .`
  
运行
---
- 运行docker-compose.yml
    - 在hadoop2.7目录下 执行`docker-compose up -d` 
- 第一次运行需要先在namenode节点格式化（使用`docker exec -it hadoop001 bash` 进入namenode节点）
  ```bin/hdfs namdenode -format```
- 启动hdfs
  ``` sbin/start-dfs.sh```
- 启动yarn
    ``` sbin/start-yarn.sh```

    

- 都正常应该是出现

  ![image-20190218085636830](assets/image-20190218085636830.png)

- 注意：
  - 出现地址错误，检查下自己配置的地址是不是对的.