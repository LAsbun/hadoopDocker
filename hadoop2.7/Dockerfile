FROM lasbun/c7-ssh:0.0.1

MAINTAINER lasbun

RUN mkdir -p /opt/software

RUN mkdir -p /opt/module

COPY jdk-8u131-linux-x64.tar.gz /opt/software

COPY hadoop-2.7.2.tar.gz /opt/software

RUN tar -zxvf /opt/software/jdk-8u131-linux-x64.tar.gz -C /opt/module/

RUN tar -zxvf /opt/software/hadoop-2.7.2.tar.gz -C /opt/module/


RUN rm /opt/software/hadoop-2.7.2.tar.gz

RUN rm /opt/software/jdk-8u131-linux-x64.tar.gz


RUN echo -e "##JAVA_HOME" >> /etc/profile

RUN echo -e "export JAVA_HOME=/opt/module/jdk1.8.0_131" >> /etc/profile

RUN echo -e 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile

RUN echo -e "##HADOOP_HOME" >> /etc/profile

RUN echo -e "HADOOP_HOME=/opt/module/hadoop-2.7.2" >> /etc/profile
RUN echo -e 'export PATH=$PATH:$HADOOP_HOME/bin' >> /etc/profile
RUN echo -e 'export PATH=$PATH:$HADOOP_HOME/sbin' >> /etc/profile

RUN source /etc/profile

RUN sed -i 's/${JAVA_HOME}/\/opt\/module\/jdk1.8.0_131/g' /opt/module/hadoop-2.7.2/etc/hadoop/hadoop-env.sh

# hdfs
RUN rm /opt/module/hadoop-2.7.2/etc/hadoop/core-site.xml
COPY ./env/core-site.xml /opt/module/hadoop-2.7.2/etc/hadoop/

RUN rm /opt/module/hadoop-2.7.2/etc/hadoop/hdfs-site.xml
COPY ./env/hdfs-site.xml /opt/module/hadoop-2.7.2/etc/hadoop/

# yarn
RUN rm /opt/module/hadoop-2.7.2/etc/hadoop/yarn-site.xml
COPY ./env/yarn-site.xml /opt/module/hadoop-2.7.2/etc/hadoop/

RUN rm /opt/module/hadoop-2.7.2/etc/hadoop/yarn-env.sh
COPY ./env/yarn-env.sh /opt/module/hadoop-2.7.2/etc/hadoop/

RUN rm /opt/module/hadoop-2.7.2/etc/hadoop/mapred-site.xml.template
COPY ./env/mapred-site.xml /opt/module/hadoop-2.7.2/etc/hadoop/

RUN rm /opt/module/hadoop-2.7.2/etc/hadoop/mapred-env.sh
COPY ./env/mapred-env.sh /opt/module/hadoop-2.7.2/etc/hadoop/

RUN echo -e "172.25.0.1	hadoop001" >> /etc/hosts
RUN echo -e "172.25.0.2	hadoop002" >> /etc/hosts
RUN echo -e "172.25.0.3	hadoop003" >> /etc/hosts
# RUN rm /opt/software/hadoop-2.7.2.tar.gz

# RUN rm /opt/software/jdk-8u131-linux-x64.tar.gz

