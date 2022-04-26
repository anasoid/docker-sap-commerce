# Prepare CX
## build

```bash
cd docker/cx/prepare
docker build -t b1 -f Dockerfile-prepare .
```

## run

```
docker run  --name b1 -v /work/mount/hybris:/hybris -p 9002:9002 -p 8983:8983  b1
```

## prepare

```
docker exec -it b1 bash
prepare.sh
initialize.sh

```

## GET Data

```bash
cd docker/cx/
rm -rf data/*
mkdir -p data/hybris/
docker cp b1:/hybrisinternal/hybris/data data/hybris/data

mkdir -p data/home
docker cp b1:/home/hybris/.pnpm-store data/home/.pnpm-store

rm -rf data/hybris/config/solr
```

# CX

## build

```bash
cd docker/cx
docker build -t d1 .
```

## run

```
docker run  --name d1 -v /work/mount/hybris:/hybris -p 9002:9002 -p 8983:8983  d1
```


# SPA

## B2C

### build

```bash
cd docker/cx/spa
docker build -t s1  .
```

### run
```
docker run --name s1  -p 4200:4200 -e BASE_URL=localhost:9002 s1
```
### DEMO :
1. **apparel-uk-spa** : http://localhost:4200/apparel-uk-spa/en/GBP/
2. **electronics-spa** : http://localhost:4200/electronics-spa/en/USD/

## B2B

### build
```bash
cd docker/cx/spa
docker build -t s2 --build-arg IS_B2B=true --build-arg BASE_SITE=powertools-spa .
```
### run

```
docker run --name s2  -p 4200:4200 -e BASE_URL=localhost:9002 s2
```
### DEMO :
1. **powertools-spa** : http://localhost:4200/powertools-spa/en/USD/
