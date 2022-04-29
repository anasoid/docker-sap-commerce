
FROM node:16

ARG IS_B2B false
ARG SPA_VERSION latest
ARG BASE_SITE apparel-uk-spa,electronics-spa
ENV SPA_VERSION ${SPA_VERSION}
ENV IS_B2B ${IS_B2B}
ENV BASE_URL localhost:9002
ENV BASE_SITE ${BASE_SITE}
ENV CURRENCY gbp,usd
ENV LANGUAGE en
ENV URL_PARAMETERS baseSite,language,currency



RUN useradd -ms /bin/bash spa

COPY entrypoint.sh  /
COPY install.sh  /

RUN npm install -g npm@latest \
    &&  npm -v \
    && npm install -g @angular/cli@12 \
    &&  ng version \
    &&  chmod +rx /entrypoint.sh \
    &&  chmod +rx /install.sh 

USER spa
WORKDIR /home/spa

RUN /install.sh


EXPOSE 4200



ENTRYPOINT ["/entrypoint.sh"]
