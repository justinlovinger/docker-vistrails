FROM debian:8
MAINTAINER Justin Lovinger

# http.debian.net seems to contain bad mirrors, use something else
RUN \
  sh -c 'echo "deb http://ftp.us.debian.org/debian jessie main" > /etc/apt/sources.list' && \
  sh -c 'echo "deb http://ftp.us.debian.org/debian jessie-updates main" >> /etc/apt/sources.list' && \
  sh -c 'echo "deb http://security.debian.org jessie/updates main" >> /etc/apt/sources.list'
# Install VisTrails deps from distrib
RUN \
  apt-get update && \
  apt-get install -y python python-dateutil python-dev \
    python-numpy python-paramiko \
    python-pip python-scipy \
    python-tz git

RUN \
  pip install git+https://github.com/vistrails/vistrails.git@v2.2

COPY startup.xml /root/.vistrails/startup.xml

# Run our vistrails file
# The docker image will need our vistrails file and a python script to run it
COPY who_tuberculosis.vt /usr/src/
COPY run_workflow.py /usr/src/
CMD python /usr/src/run_workflow.py /usr/src/who_tuberculosis.vt alias country=Nigeria
