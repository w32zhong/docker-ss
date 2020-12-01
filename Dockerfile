FROM debian:buster
#RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
#RUN sed -i s@/security.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install --no-install-recommends gettext libtool autoconf libpcre3-dev asciidoc xmlto libev-dev libc-ares-dev automake libmbedtls-dev libsodium-dev git
RUN apt-get -y install --reinstall ca-certificates

WORKDIR /root

RUN git clone --depth 1 https://github.com/t-k-/simple-obfs.git
RUN cd simple-obfs && git submodule update --init --recursive
RUN apt-get -y install --no-install-recommends build-essential
RUN cd simple-obfs && ./autogen.sh && ./configure && make && make install

RUN git clone --depth 1 https://github.com/t-k-/shadowsocks-libev.git
RUN cd shadowsocks-libev && git submodule update --init --recursive
RUN cd shadowsocks-libev && ./autogen.sh && ./configure && make && make install

COPY ./ss.json /root
CMD /usr/local/bin/ss-server -c /root/ss.json
