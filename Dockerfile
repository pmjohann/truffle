FROM alpine:3.14.2

# DEFINE TRUFFLE VERSION TO BE INSTALLED
ARG VERSION=5.4.12

# INSTALL DEPENDENCIES
RUN apk add --no-cache nodejs npm && \
    npm i -g npm && \
    npm i -g truffle@$VERSION && \
    apk del npm

# SET WORKDIR, ENTRYPOINT AND DEFAULT CMD
WORKDIR /app
ENTRYPOINT ["truffle"]
CMD ["test", "--show-events", "--compile-all"]
