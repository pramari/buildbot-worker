FROM        buildbot/buildbot-worker:latest
MAINTAINER  Andreas Neumeier <andreas@neumeier.org>

# Install custom required packages

USER root
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \ 
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | tee /usr/share/keyrings/cloud.google.gpg && \
    apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install -q \
    default-libmysqlclient-dev \ 
    google-cloud-cli
