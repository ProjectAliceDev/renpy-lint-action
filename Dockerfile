FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install --yes bzip2 wget libxext6 libllvm6.0

COPY lint.sh /lint.sh

ENTRYPOINT ["/lint.sh"]
