FROM lsiobase/alpine:3.12

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="blog.auska.win version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Auska"

ENV GLIBC_VERSION=2.32-r0 TZ=Asia/Shanghai PORT=8886 VER=2.1.1

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache wget tar && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk" && \
 apk add --allow-untrusted glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
 rm -f glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
 wget http://dl.verysync.com/releases/v${VER}/verysync-linux-amd64-v${VER}.tar.gz && \
 tar xf verysync-linux-amd64-v${VER}.tar.gz -C /tmp && \
 cp /tmp/verysync-linux-amd64-v${VER}/verysync /bin && \
 rm -rf /tmp/verysync-linux-amd64-v${VER} && \
 apk del wget

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8886 22330
VOLUME /verysync /mnt
