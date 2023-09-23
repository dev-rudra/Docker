FROM centos:7

MAINTAINER Rudra Magar <rkm.com.np>
LABEL version="1.0" location="Tokyo, Japan" type="centos-ssh"

# Install packages
RUN yum -y update && \
    yum -y install sudo passwd initscripts openssh-server openssh-clients service vim openssl && \
    yum clean all

# Update root password
RUN echo 'root:root' | chpasswd
RUN adduser rkm && \
    echo 'rkm:root' | chpasswd && \
    usermod -aG wheel rkm

# Configure SSHD
RUN mkdir -p /var/run/sshd ; chmod -rx /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

# Configure sshd_config
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

#Deploy SSH keys
RUN mkdir /root/.ssh/ && \
	echo "ssh-rsa AAAAB3Nz4........l9Ns5p989oHLcSGJ" > ~/.ssh/authorized_keys && \
	chmod 700 ~/.ssh && \
	chmod 600 ~/.ssh/authorized_keys

RUN mkdir /home/rkm/.ssh/ && \
	echo "ssh-rsa AAAAB3NzaC........9Ns5p989oHLcSGJ" > /home/rkm/.ssh/authorized_keys && \
	chmod 700 /home/rkm/.ssh && \
	chmod 600 /home/rkm/.ssh/authorized_keys && \
	chown -R rkm:rkm /home/rkm/.ssh/

# Configure sudoers
RUN echo 'ALL ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
