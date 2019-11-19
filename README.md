## Epitest docker with boost and sfml compiled for conan

#### Requirements
____

You need to install `docker`, to build correctly epitest-docker-boost-sfml image

#### Epitest-Docker-Boost-SFML
____

Just specify the tag you want to apply to the image on the build.sh :

``` bash
docker build -t epitest-docker-boost-sfml .
```

#### Deployment
____


##### Login into dockerhub

``` bash
docker login -u username
```

You'll be prompted for your password

##### Push docker image

**`epitest-docker-sfml-boost`**
``` bash
docker push lilianarago/epitest-docker-boost-sfml:latest
```

Where `latest` is the tag of image you want to push, e.g. : latest, devel, coverage
