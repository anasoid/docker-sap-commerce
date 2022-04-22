
FROM sapmachine:11

LABEL org.opencontainers.image.authors="Anas OUFDOU <oufdou.anas@gmail.com>"

#https://sap.github.io/spartacus-docs/installing-sap-commerce-cloud-2105/#step-1-download-unzip-and-create-the-new-recipe
ENV SPA_DOWNLOAD_URL=https://github.com/SAP/spartacus/releases/download/storefront-4.1.0/spartacussampledata.2105.zip

ENV PROJECT_FOLDER /project 

ENV HYBRIS_SOURCE_DIR /hybris
ENV HYBRIS_HOME_DIR /hybrisinternal
ENV HYBRIS_BIN_DIR  $HYBRIS_HOME_DIR/hybris/bin
ENV HYBRIS_CONFIG_DIR  $HYBRIS_HOME_DIR/hybris/config
ENV HYBRIS_DATA_DIR  /data
ENV HYBRIS_LOG_DIR $HYBRIS_HOME_DIR/hybris/log
ENV HYBRIS_TEMP_DIR  $HYBRIS_HOME_DIR/hybris/temp/hybris
ENV CUSTOM_FOLDER /custom 


RUN useradd -ms /bin/bash hybris



COPY custom  $CUSTOM_FOLDER
COPY scripts  /scripts
COPY entrypoint.sh  /

COPY data/home/.  /home/hybris
COPY data/data  $HYBRIS_DATA_DIR

RUN chown -R hybris:hybris /home/hybris \
    && chown -R hybris:hybris $HYBRIS_DATA_DIR

RUN chmod +rx scripts/* \
    && chmod +rx /entrypoint.sh




RUN mkdir -p $HYBRIS_HOME_DIR
RUN chmod 777 $HYBRIS_HOME_DIR


EXPOSE 9001 9002 8983

USER hybris
WORKDIR /home/hybris

ENTRYPOINT ["/entrypoint.sh"]
