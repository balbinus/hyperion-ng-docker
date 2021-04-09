FROM debian:buster-slim

ENV APP_NAME Hyperion.NG
ENV ARCH armv7l
ENV RELEASE 2.0.0-alpha.9

RUN apt-get update \
	&& apt-get install -y \
	     wget libqt5sql5-sqlite openssl libx11-6 libusb-1.0-0 libexpat-dev libgl-dev libfreetype6 cec-utils \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apt/*

RUN wget https://github.com/hyperion-project/hyperion.ng/releases/download/${RELEASE}/Hyperion-${RELEASE}-Linux-${ARCH}.deb \
	&& dpkg -i ./Hyperion-${RELEASE}-Linux-${ARCH}.deb \
	&& apt-get install -f \
	&& rm -f Hyperion-${RELEASE}-Linux-${ARCH}.deb

ENTRYPOINT ["/usr/bin/hyperiond"]

EXPOSE 8090 8091 19333 19400 19444 19445

VOLUME /config

ENTRYPOINT hyperiond -u /config
