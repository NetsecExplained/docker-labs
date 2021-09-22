FROM jboss/base:latest
EXPOSE 8080

ENV SERVER_HOME /opt/jboss/server/
ENV JBOSS_HOME /opt/jboss/server/jboss-6.1.0.Final/

USER root

RUN mkdir $SERVER_HOME

RUN cd $SERVER_HOME \
    && curl -O https://download.jboss.org/jbossas/6.1/jboss-as-distribution-6.1.0.Final.zip \
    && unzip jboss-as-distribution-6.1.0.Final.zip \
    && curl -O https://download.java.net/openjdk/jdk7u75/ri/jdk_ri-7u75-b13-linux-x64-18_dec_2014.tar.gz \
    && tar xfz jdk_ri-7u75-b13-linux-x64-18_dec_2014.tar.gz \
    && rm jdk_ri-7u75-b13-linux-x64-18_dec_2014.tar.gz \
    && rm jboss-as-distribution-6.1.0.Final.zip

RUN echo "JAVA=/opt/jboss/server/java-se-7u75-ri/bin/java" >> /opt/jboss/server/jboss-6.1.0.Final/bin/run.conf


ENV LAUNCH_JBOSS_IN_BACKGROUND true

CMD ["/opt/jboss/server/jboss-6.1.0.Final/bin/run.sh", "-b", "0.0.0.0"]

# build container: docker build . -t jboss
# run container: docker run [-d] -p 8080:8080 jboss
