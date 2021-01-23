FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

ENV LANG ru_RU.UTF-8

ARG binaries=./vspublish

ENV BINPREFIX=/var/osp.net
ENV ENTRYPOINTDLL=$BINPREFIX/OneScript.WebHost.dll
ENV ASPNETCORE_ENVIRONMENT=Production
ENV ASPNETCORE_URLS=http://0.0.0.0:5000

ADD ${binaries} ${BINPREFIX}

EXPOSE 5000

RUN echo "#!/bin/bash \n dotnet ${ENTRYPOINTDLL}" > /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME [ "/app" ]
WORKDIR /app

ENTRYPOINT [ "/entrypoint.sh" ]