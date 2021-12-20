FROM ubuntu

# Env Setting =============================================
ENV USER=dhuni
ENV UID=1000

# Root Setting ============================================

# Setup apt
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update

# Setup User
RUN useradd -m $USER -u $UID \
	&& echo "$USER:dhuni" | chpasswd \
	&& mkdir -p /home/$USER \
	&& chown -R $USER:$USER /home/$USER

# Setup Sudo
RUN apt install -y sudo \
	&& adduser $USER sudo \
	&& echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Setup SSH
COPY ./src/authorized_keys_docker /home/$USER/.ssh/authorized_keys
RUN apt install -y openssh-server \
	&& mkdir -p /var/run/sshd \
	&& sed -i "s/^.*PubkeyAuthentication.*$/PubkeyAuthentication yes/" /etc/ssh/sshd_config \
	&& sed -i "s/^.*PasswordAuthentication.*$/PasswordAuthentication no/" /etc/ssh/sshd_config \
	&& chown -R $USER:$USER /home/$USER/.ssh \
	&& chmod 700 /home/$USER/.ssh

# User Setting ============================================
USER $USER
WORKDIR /home/$USER

# Setup Node
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

# Setup myenv
RUN sudo apt install -y git \
	&& git clone https://github.com/skyrich2000/env /home/$USER/.myenv \
	&& cd /home/$USER/.myenv \
	&& bash apply_ubuntu.sh \
	&& echo dhuni | chsh -s /usr/bin/zsh

EXPOSE 22

CMD ["sudo", "/usr/sbin/sshd", "-D"]
