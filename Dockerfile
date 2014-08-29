FROM debian:jessie
MAINTAINER Michael Barton, mail@michaelbarton.me.uk

RUN apt-get update -y
RUN apt-get install -y wget make g++ libxerces-c3.1 libgmpxx4ldbl

RUN wget \
  ftp://ftp.broadinstitute.org/pub/crd/ALLPATHS/Release-LG/latest_source_code/allpathslg-50688.tar.gz \
  --output-document=/tmp/allpaths.tar.gz
RUN mkdir /tmp/allpaths
RUN tar xzf /tmp/allpaths.tar.gz --directory /tmp/allpaths --strip-components=1

RUN cd /tmp/allpaths && \
       ./configure && \
       make && \
       make install
