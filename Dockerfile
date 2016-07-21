#
# hbase dockerfile
#
# https://github.com/sel-fish/hbase.docker
#

# Pull base image.
FROM java:8
MAINTAINER fenqi <fenqi@mogujie.com>

# Install Hbase.
ADD hbase-1.2.0-cdh5.7.0 /opt/hbase
RUN export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
RuN echo "export JAVA_HOME=\"/usr/lib/jvm/java-8-openjdk-amd64\"" >> /root/.bashrc

# Expose Hbase ports
#
#   2181 – zookeeper port
#   60000 – master api port
#   60010 – master web port
#   60020 – regionserver api port
#   60030 – regionserver web port
EXPOSE 2181 60000 60010 60020 60030

# Define default command.
CMD ["/opt/hbase/bin/hbase", "master", "start"]
