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