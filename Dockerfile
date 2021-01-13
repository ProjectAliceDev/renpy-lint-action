FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install --yes bzip2 wget libx11-6 libXext.x86_64 libXext.x86_64 libXext.x86_64

COPY lint.sh /lint.sh

ENTRYPOINT ["/lint.sh"]
