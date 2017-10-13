# docker-isis3
Docker container for USGS's Integrated Software for Imagers and Spectrometers version 3 (ISIS3). Singularity file is also offered which bootstraps the Docker image.

## Docker

```shell
# create ISIS instance
[user@computer]$ docker run -dt -v /path/to/data:/isis3data --name isis3 kelvinrr/isis3

# do things
[user@computer]$ docker exec isis3 stats from=/isis3data/data/base/testData/MarsPlanetaryRadius_45bottom.cub
Group = Results
  From                    = /isis3data/data/base/testData/MarsPlanetaryRadius-
                            _45bottom.cub
  Band                    = 1
  Average                 = 3388394.0
  StandardDeviation       = 6844.4887355016
  Variance                = 46847026.050409
  Median                  = 3388394.1808194
  Mode                    = 3376544.0
  Skew                    = -7.92547477633476e-05
  Minimum                 = 3376544.0
  Maximum                 = 3400244.0
  Sum                     = 1.9048334634554e+13
  TotalPixels             = 5621641
  ValidPixels             = 5621641
  OverValidMaximumPixels  = 0
  UnderValidMinimumPixels = 0
  NullPixels              = 0
  LisPixels               = 0
  LrsPixels               = 0
  HisPixels               = 0
  HrsPixels               = 0
```

## Singularity
```shell
[user@computer]$ singularity pull --name isis3.img shub://Kelvinrr/docker-isis3
Progress |===================================| 100.0%
Done. Container is at: /home/vagrant/Kelvinrr-docker-isis3-master.simg
[user@computer]$ singularity exec --bind path/to/data:/isis3data isis3.simg stats from=/isis3data/data/base/testData/MarsPlanetaryRadius_45bottom.cub
Group = Results
  From                    = /isis3data/data/base/testData/MarsPlanetaryRadius-
                            _45bottom.cub
  Band                    = 1
  Average                 = 3388394.0
  StandardDeviation       = 6844.4887355016
  Variance                = 46847026.050409
  Median                  = 3388394.1808194
  Mode                    = 3376544.0
  Skew                    = -7.92547477633476e-05
  Minimum                 = 3376544.0
  Maximum                 = 3400244.0
  Sum                     = 1.9048334634554e+13
  TotalPixels             = 5621641
  ValidPixels             = 5621641
  OverValidMaximumPixels  = 0
  UnderValidMinimumPixels = 0
  NullPixels              = 0
  LisPixels               = 0
  LrsPixels               = 0
  HisPixels               = 0
  HrsPixels               = 0
```
