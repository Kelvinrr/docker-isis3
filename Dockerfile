FROM centos:centos7

MAINTAINER Kelvin Rodriguez <kr788@nau.edu>

# install pre-reqs
RUN yum -y update
RUN yum -y install gcc-gfortran
RUN yum -y install boost-devel
RUN yum -y install rsync
RUN yum -y install xorg-x11-xauth xterm
RUN yum -y install libicu
RUN yum -y install wget
RUN yum -y install libjpeg
RUN yum -y install make
RUN yum -y install mesa-libGL
RUN yum -y install libXi
RUN yum -y install libXcursor
RUN yum -y install libXcomposite
RUN yum -y install glibc-devel.x86_64
RUN yum -y install libXtst
RUN yum -y install libxslt
RUN yum -y install bzip2
RUN yum -y install alsa-lib.x86_64
RUN yum -y install zlib-devel.x86_64

# install anaconda, makes it easier to install some binaries
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN bash miniconda.sh -b -p /root/miniconda
ENV PATH "/root/miniconda/bin:$PATH"
RUN conda config --set always_yes yes --set changeps1 no
RUN conda update -q conda
RUN conda config --add channels conda-forge

# install the things
RUN conda install libgcc
RUN conda install pyqt

# install libicu binaries
RUN wget http://download.icu-project.org/files/icu4c/52.1/icu4c-52_1-RHEL6-x64.tgz
RUN tar -xvf icu4c-52_1-RHEL6-x64.tgz -C /

# install libpng16
RUN wget https://sourceforge.net/projects/libpng/files/libpng16/1.6.34/libpng-1.6.34.tar.xz/download
RUN tar -xvf download
RUN ./libpng-1.6.34/configure
RUN make install

# Handle different install locations the lazy way
ENV LD_LIBRARY_PATH /root/miniconda/lib:/root/anaconda3/envs/isis3/lib:/root/anaconda3/envs/isis3/libexec:/usr/local/lib

# enable use of the entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat
RUN chmod +x /docker-entrypoint.sh

# install ISIS
RUN rsync -azv --delete --partial isisdist.astrogeology.usgs.gov::x86-64_linux_FEDORA/isis /

# make required directories
RUN mkdir /isis3data
ENV ISIS3DATA /isis3data
ENV ISISROOT /isis/
ENV PATH "/isis/bin:$PATH"
RUN echo '. /isis/scripts/isis3Startup.sh' >> ~/.bashrc

CMD bash
