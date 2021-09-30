FROM alpine:3.14.2

# DEFINE TRUFFLE VERSION TO BE INSTALLED
ARG TRUFFLE_VER=5.4.12
ARG SOLC_VER=0.8.9

# INSTALL DEPENDENCIES
RUN apk add --no-cache nodejs npm && \
    npm i -g npm && \
    npm i -g truffle@$TRUFFLE_VER && \
    apk del npm && \
    truffle obtain --solc $SOLC_VER

# SET WORKDIR, ENTRYPOINT AND DEFAULT CMD
WORKDIR /app
ENTRYPOINT ["truffle"]
CMD ["test", "--show-events", "--compile-all"]
