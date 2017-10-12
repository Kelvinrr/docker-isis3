# Trivial Singularity image, piggy backs off of Docker container
Bootstrap: docker
From: kelvinrr/isis3

%environment
    LD_LIBRARY_PATH=/root/miniconda/lib:/root/anaconda3/envs/isis3/lib:/root/anaconda3/envs/isis3/libexec:/usr/local/lib

%runscript
  /bin/bash
