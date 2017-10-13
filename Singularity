# Trivial Singularity image, piggy backs off of Docker container
Bootstrap: docker
From: kelvinrr/isis3

# handle permission issue in Singularity for Docker's home folder
%post
  chmod 775 /root

%runscript
  /bin/bash
