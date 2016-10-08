FROM centos:7

ARG user=appuser
ARG group=appuser
ARG uid=30000
ARG gid=30000
ARG TINI_VERSION=0.9.0
ARG TINI_SHA=fa23d1e20732501c3bb8eeeca423c89ac80ed452

RUN groupadd ${group} -g ${gid} \
 && useradd -u ${uid} -g ${group} -m -s /sbin/nologin -c "Application user" ${user} \
 && yum -y install xmlstarlet saxon augeas bsdtar unzip patch\
 && yum clean all \
 && curl -fsSL https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static -o /bin/tini \
 && chmod +x /bin/tini \
 && echo "${TINI_SHA}  /bin/tini" | sha1sum -c -
