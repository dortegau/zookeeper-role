FROM idealista/jdk:3.3.0-debian9-openjdk
LABEL maintainer="idealista <labs@idealista.com>"
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /usr/share/man/man1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       sudo systemd \
    python-pip python-dev \
    && apt-get clean

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]
