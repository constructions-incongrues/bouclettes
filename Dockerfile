FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bookletimposer \
        ca-certificates \
        make \
        qpdf

ENV BOUCLETTES_LENGTH=40 

VOLUME [ "/data" ]

WORKDIR /usr/src/app

COPY ./src /usr/src/app

ENTRYPOINT [ "make" ]

CMD [ "booklets", "permissions" ]
