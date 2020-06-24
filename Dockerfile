FROM centos:7.8.2003

MAINTAINER Timothee Aufort

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    POSTGRESQL_YUM_RPM_NAME=pgdg-redhat-repo-latest.noarch.rpm

ARG OC_VERSION=4.3
ARG POSTGRESQL_VERSION=12

# Common tools
RUN yum update -y && \
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y curl wget

# OpenShift cli
RUN curl -sLo /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v$(echo $OC_VERSION | cut -d'.' -f 1)/clients/oc/$OC_VERSION/linux/oc.tar.gz && \
    tar xzvf /tmp/oc.tar.gz -C /usr/local/bin/

# PSQL
RUN wget -O /tmp/$POSTGRESQL_YUM_RPM_NAME https://download.postgresql.org/pub/repos/yum/$POSTGRESQL_VERSION/redhat/rhel-7-x86_64/$POSTGRESQL_YUM_RPM_NAME && \
    yum install -y /tmp/$POSTGRESQL_YUM_RPM_NAME && \
    yum install -y postgresql${POSTGRESQL_VERSION}-contrib

# Clean
RUN yum clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /tmp/oc.tar.gz