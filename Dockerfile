FROM alpine:3.13.4

# DEFINE TRUFFLE VERSION TO BE INSTALLED
ARG VERSION=5.3.0

# INSTALL DEPENDENCIES
RUN apk add --no-cache nodejs npm && \
    npm i -g npm && \
    npm i -g truffle@$VERSION && \
    apk del npm

# SET WORKDIR, ENTRYPOINT AND DEFAULT CMD
WORKDIR /app
ENTRYPOINT ["truffle"]
CMD ["test", "--show-events", "--compile-all"]
