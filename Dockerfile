FROM alpine:3.10
RUN apk add nodejs npm
RUN npm i -g --unsafe-perm=true --allow-root truffle solc
WORKDIR /app
ENTRYPOINT ["truffle"]
CMD ["test", "--show-events", "--compile-all"]
