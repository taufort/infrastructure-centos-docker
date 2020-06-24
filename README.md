# infrastructure-centos-docker
A CentOS 7 docker image with multiple infrastructure binaries dedicated for CI builds

# OpenShift CLI

Choose the version for the openshift cli based on what is available on OpenShift mirror: https://mirror.openshift.com/pub/

Add the version as value for ARG `OC_VERSION`. Example:

`docker build -t taufort/infrastructure-centos-docker:oc-4.5 --build-arg OC_VERSION=4.5 .`

# PSQL CLI

Choose the version for the PSQL cli based on what is available on PostgreSQL site: https://download.postgresql.org/pub/repos/yum/

Add the version as value for ARG `POSTGRESQL_VERSION`. Example:

`docker build -t taufort/infrastructure-centos-docker:psql-11 --build-arg POSTGRESQL_VERSION=11 .`
