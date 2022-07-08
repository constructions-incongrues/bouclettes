FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bookletimposer \
        ca-certificates \
        make \
        qpdf

ENV BOUCLETTES_SHARD_LENGTH=40 
ENV BOUCLETTES_DATA_DIR=/data 
ENV BOUCLETTES_PROJECT=default

VOLUME [ "/data" ]

WORKDIR /usr/src/app

COPY ./src /usr/src/app

ENTRYPOINT [ "make" ]

CMD [ "booklets", "permissions" ]
