FROM alpine:3.13.4

# DEFINE TRUFFLE & SOLC VERSIONS TO BE INSTALLED
ARG TRUFFLE_VERSION=5.3.0
ARG SOLC_VERSION=0.8.3

# INSTALL DEPENDENCIES
RUN apk add nodejs npm
RUN npm i -g npm && npm i -g truffle@$TRUFFLE_VERSION solc@$SOLC_VERSION
WORKDIR /app
ENTRYPOINT ["truffle"]
CMD ["test", "--show-events", "--compile-all"]
