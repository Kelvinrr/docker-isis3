# docker-isis3
Docker container for USGS's Integrated Software for Imagers and Spectrometers version 3 (ISIS3)

```shell
# create ISIS instance
docker create -t -i --name isis kelvinrr/isis3

# fire up the container in interactive mode
docker start -i isis

# do things
root@701e40cb352c:/# which jigsaw
/isis/isis/bin/jigsaw
```
