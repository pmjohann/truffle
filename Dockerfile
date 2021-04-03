FROM alpine:3.13.4

# DEFINE TRUFFLE & SOLC VERSIONS TO BE INSTALLED
ARG TRUFFLE_VERSION=5.3.0
ARG SOLC_VERSION=0.8.3

# INSTALL DEPENDENCIES
RUN apk add --no-cache nodejs npm && \
    npm i -g npm && \
    npm i -g truffle@$TRUFFLE_VERSION solc@$SOLC_VERSION && \
    apk del npm

# SET WORKDIR, ENTRYPOINT AND DEFAULT CMD
WORKDIR /app
ENTRYPOINT ["truffle"]
CMD ["test", "--show-events", "--compile-all"]
