FROM mono:slim AS base

RUN apt-get update && \
    apt-get install -y curl nuget vim zip

ENV TERRARIA_RELEASE=1404

ADD https://terraria.org/system/dedicated_servers/archives/000/000/038/original/terraria-server-$TERRARIA_RELEASE.zip /

RUN mkdir /tmp/terraria && mkdir /terraria && \
        cd /tmp/terraria && \
        unzip /terraria-server-$TERRARIA_RELEASE.zip && \
        cp -r $TERRARIA_RELEASE/Linux/* /terraria && rm -rf $TERRARIA_RELEASE && \
        chmod +x /terraria/TerrariaServer.bin*

LABEL maintainer="ZD Yu <zhendong.zd.yu@gmail.com>"

ENTRYPOINT ["/terraria/TerrariaServer.bin.x86_64"]