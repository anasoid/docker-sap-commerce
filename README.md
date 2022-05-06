# docker-sap-commerce

Docker SAP commerce for demo with Spartacus and Accelerator.

# Quick reference

- **Where to get help**:
  - [Issues](https://github.com/anasoid/docker-sap-commerce/issues)
  - [Discussions](https://github.com/anasoid/docker-sap-commerce/discussions)
  - [Documentation](https://github.com/anasoid/docker-sap-commerce)

## Image version
###  SAP Commerce (anasoid/sap-commerce)

- [`latest`, `2105`, `2105.10` ](https://github.com/anasoid/docker-sap-commerce/blob/main/docker/cx/Dockerfile)

###  SAP Spartacus (anasoid/sap-spartacus)
- [`latest`, `4.3` ](https://github.com/anasoid/docker-sap-commerce/blob/main/docker/spa/Dockerfile)
- [`latest-b2b`, `4.3-b2b`](https://github.com/anasoid/docker-sap-commerce/blob/main/docker/spa/Dockerfile)

## Features

1. Start SAP commerce demo in less than 10 minutes.
2. Accelerator B2C apparel, electronics.
3. Accelerator B2B powertools.
4. Spartacus B2C apparel, electronics.
5. Spartacus B2B powertools.
6. SAP platform is not provided in image, a local platform is required to start SAP commerce container.
7. Rootless docker image.

## Content

- [docker-sap-commerce](#docker-sap-commerce)
- [Quick reference](#quick-reference)
  - [Image version](#image-version)
    - [SAP Commerce (anasoid/sap-commerce)](#sap-commerce-anasoidsap-commerce)
    - [SAP Spartacus (anasoid/sap-spartacus)](#sap-spartacus-anasoidsap-spartacus)
  - [Features](#features)
  - [Content](#content)
- [Getting Started](#getting-started)
  - [Start SAP Commerce](#start-sap-commerce)
  - [Start SAP Spartacus](#start-sap-spartacus)
    - [Start SAP Spartacus B2C](#start-sap-spartacus-b2c)
    - [Start SAP Spartacus B2B](#start-sap-spartacus-b2b)
  - [Parameters](#parameters)
    - [Spartacus configuration](#spartacus-configuration)
- [Troubleshooting & Limitation](#troubleshooting--limitation)


# Getting Started

## Start SAP Commerce

1. Unzip SAP Commerce to a folder .
2. configure hosts, in /etc/hosts for linux or c:\Windows\System32\Drivers\etc\hosts for windows add :
   1. 127.0.0.1 electronics.local apparel-de.local apparel-uk.local powertools.local
3. Start sap commerce and replace `<sap-commerce-platform>` with local hybris platform with the same version as docker image.

```shell
docker run  --name hybris -v <sap-commerce-platform>:/hybris -p 9002:9002 -p 8983:8983  anasoid/sap-commerce:2105.10
```
3. Wait ~10 minutes until hybris start:
4. Check accelerator B2C:
   1. https://apparel-uk.local:9002/yacceleratorstorefront/
   2. https://apparel-de.local:9002/yacceleratorstorefront/
   3. https://electronics.local:9002/yacceleratorstorefront/
5. Check accelerator B2B:
   1. https://powertools.local:9002/yb2bacceleratorstorefront
   2. Use the folowing customer to login with password '1234'
      1. akiro.nakamura@pronto-hw.com
      2. hanna.schmidt@pronto-hw.com
      3. linda.wolf@pronto-hw.com
      4. linda.wolf@rustic-hw.com
      5. hanna.schmidt@rustic-hw.com
      6. akiro.nakamura@rustic-hw.com

## Start SAP Spartacus

Start only one Spartacus instance on the same time.

### Start SAP Spartacus B2C

1. Start SAP Spartacus B2C.

```shell
docker run --name spa  -p 4200:4200 -e "BASE_URL=localhost:9002" anasoid/sap-spartacus:4.3
```
3. Wait ~5 minutes until Spartacus start.
4. Check SAP commerce is laredy started and certificat is accepted for https://localhost:9002.
5. Check Spartacus B2C :
   1. http://localhost:4200/apparel-uk-spa/en/GBP/
   2. http://localhost:4200/electronics-spa/en/USD/

### Start SAP Spartacus B2B

1. Start SAP Spartacus B2B.

```shell
docker run --name spa-b2b  -p 4200:4200 -e "BASE_URL=localhost:9002" anasoid/sap-spartacus:4.3-b2b
```
3. Wait ~5 minutes until Spartacus start.
4. Check SAP commerce is laredy started and certificat is accepted for https://localhost:9002.
5. Check Spartacus B2C :
   1. http://localhost:4200/powertools-spa/en/USD/




## Parameters

### Spartacus configuration 

| Environment variables | Description      | Default            |
| --------------------- | ---------------- | ------------------ |
| `BASE_URL`            | SAP Commerce URL | elasticsearch:9200 |



# Troubleshooting & Limitation

1. Backoffice Solr indexation not work : bug in SAP commerce.
1. Change sincedb file can't done on logstash with Elasticsearch without building image.
