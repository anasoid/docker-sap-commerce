
FROM sapmachine:17

LABEL org.opencontainers.image.authors="Anas OUFDOU <oufdou.anas@gmail.com>"

#https://sap.github.io/spartacus-docs/installing-sap-commerce-cloud-2105/#step-1-download-unzip-and-create-the-new-recipe
ENV SPA_DOWNLOAD_URL=https://github.com/SAP/spartacus/releases/download/storefront-4.1.0/spartacussampledata.2105.zip

ENV PROJECT_FOLDER /home/hybris/hybris 

ENV HYBRIS_SOURCE_DIR /hybris
ENV HYBRIS_HOME_DIR /home/hybris/hybris 
ENV HYBRIS_BIN_DIR  $HYBRIS_HOME_DIR/hybris/bin
ENV HYBRIS_CONFIG_DIR  $HYBRIS_HOME_DIR/hybris/config
ENV HYBRIS_DATA_DIR  $PROJECT_FOLDER/hybris/data
ENV HYBRIS_LOG_DIR $PROJECT_FOLDER/hybris/log
ENV HYBRIS_TEMP_DIR  $HYBRIS_HOME_DIR/hybris/temp/hybris
ENV CUSTOM_FOLDER /custom 

ENV PATH "/scripts:${PATH}"
RUN useradd -ms /bin/bash hybris

RUN mkdir -p $HYBRIS_HOME_DIR/hybris \
    && chown -R hybris:hybris $HYBRIS_HOME_DIR


COPY --chown=hybris:hybris prepare/custom  $CUSTOM_FOLDER
COPY --chown=hybris:hybris prepare/scripts  /scripts
COPY entrypoint.sh  /


COPY --chown=hybris:hybris data/home/.  /home/hybris
RUN ls -la $HYBRIS_HOME_DIR \
    && ls -la /home/hybris
COPY --chown=hybris:hybris data/hybris/data  $HYBRIS_DATA_DIR


RUN chmod +rx scripts/* \
    && chmod +rx /entrypoint.sh

RUN apt-get update && apt-get install -y \
  wget \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 9001 9002 9003 9004 8000 8983

USER hybris
WORKDIR /home/hybris

ENTRYPOINT ["/entrypoint.sh"]
