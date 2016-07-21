# hbase.docker

## summary
Run a hbase standalone service in docker.  
Use hbase tarball from project https://github.com/sel-fish/hbase-1.2.0-cdh5.7.0   
This project changes a little bit to original hbase-1.2.0-cdh5.7.0 as described [here](https://github.com/sel-fish/hbase-1.2.0-cdh5.7.0/releases/tag/mj23)

## background

need to access hbase service from my mac which i named ```braavos```.  
got a docker-machine ```pentos``` the ip of which is ```192.168.99.100```.

## tutorial

1. login to ```pentos``` and build image
  ```
git clone https://github.com/sel-fish/hbase.docker.git
cd hbase.docker
docker build -t debian-hbase .
```

2. run container on ```pentos```
  ```
docker run -d -h myhbase -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60020:60020 -p 60030:60030 --name pyke debian-hbase
```

3. check the log of hbase
  ```
docker logs `docker ps -a |grep pyke |awk '{print $1}'`
```

4. add entry ```192.168.99.100 myhbase``` to ```/etc/hosts``` on ```braavos```

5. now connect to ```myhbase``` in project on ```braavos```
  ```
onfiguration config = HBaseConfiguration.create();
config.set("hbase.zookeeper.quorum", "myhbase");
config.set("hbase.zookeeper.property.clientPort","2181");
HBaseAdmin.checkHBaseAvailable(config);
```

