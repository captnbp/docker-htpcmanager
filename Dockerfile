FROM	ubuntu:14.04
MAINTAINER	Benoît Pourre "benoit.pourre@gmail.com"

RUN	locale-gen en_US en_US.UTF-8

# Make sure we don't get notifications we can't answer during building.
ENV	DEBIAN_FRONTEND noninteractive

# Update the system
RUN	apt-get -q update
RUN	apt-mark hold initscripts udev plymouth mountall
RUN	apt-get -qy --force-yes dist-upgrade

RUN	apt-get install -qy --force-yes git supervisor 
RUN	apt-get -yq install libjpeg8-dev libpng-dev libfreetype6-dev zlib1g-dev libopenjpeg-dev libwebp-dev git python-pip
RUN	cd /srv && git clone https://github.com/styxit/HTPC-Manager.git htpc-manager

#Expose HTPC Manager port
EXPOSE	8085

RUN	apt-get install -qy python-imaging python-psutil python-pil
# Clean up
RUN	apt-get clean && rm -rf /tmp/* /var/tmp/* && rm -rf /var/lib/apt/lists/* && rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup

ENTRYPOINT	["/usr/bin/python", "/srv/htpc-manager/Htpc.py"]
