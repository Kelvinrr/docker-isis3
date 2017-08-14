FROM ubuntu:xenial

MAINTAINER Kelvin Rodriguez <kr788@nau.edu>

# install pre-reqs
RUN apt-get update
RUN apt-get install -y libx11-dev
RUN apt-get install -y gfortran
RUN apt-get install -y xorg openbox
RUN apt-get install -y libboost-dev
RUN apt-get install -y rsync

# install ssh support
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22

# for docs
RUN apt-get update && apt-get install -y firefox

# install ISIS
RUN rsync -azv --delete --partial isisdist.astrogeology.usgs.gov::x86-64_linux_UBUNTU/isis /

RUN mkdir /isis3data
ENV ISIS3DATA /isis3data
ENV ISISROOT /isis/isis
RUN echo '. /isis/isis/scripts/isis3Startup.sh' >> ~/.bashrc


COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat
RUN chmod +x /docker-entrypoint.sh

# ENTRYPOINT ["/docker-entrypoint.sh"]
