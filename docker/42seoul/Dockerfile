FROM ubuntu

# Env Setting =============================================
ENV USER=dhuni
ENV UID=1000
ENV DEBIAN_FRONTEND="noninteractive"

# Root Setting ============================================

# Setup User
RUN useradd -m $USER -u $UID \
	&& echo "$USER:dhuni" | chpasswd \
	&& mkdir -p /home/$USER \
	&& chown -R $USER:$USER /home/$USER

# Setup Sudo
RUN apt update \
	&& apt install -y sudo \
	&& adduser $USER sudo \
	&& echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Setup SSH
COPY ./src/authorized_keys_docker /home/$USER/.ssh/authorized_keys
RUN apt update \
	&& apt install -y openssh-server \
	&& mkdir -p /var/run/sshd \
	&& sed -i "s/^.*PubkeyAuthentication.*$/PubkeyAuthentication yes/" /etc/ssh/sshd_config \
	&& sed -i "s/^.*PasswordAuthentication.*$/PasswordAuthentication no/" /etc/ssh/sshd_config \
	&& chown -R $USER:$USER /home/$USER/.ssh \
	&& chmod 700 /home/$USER/.ssh

# Setup Tools
RUN apt update \
	&& apt install -y build-essential \
					  net-tools

# User Setting ============================================
USER $USER
WORKDIR /home/$USER

# Setup myenv
RUN sudo apt update \
	&& sudo apt install -y git \
	&& git clone https://github.com/skyrich2000/env /home/$USER/.myenv \
	&& cd /home/$USER/.myenv \
	&& bash apply_ubuntu.sh \
	&& echo dhuni | chsh -s /usr/bin/zsh

# Setup Node
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | /usr/bin/zsh \
	&& /usr/bin/zsh -c "source ~/.zshrc && nvm install 14.17.6"

EXPOSE 22

CMD ["sudo", "/usr/sbin/sshd", "-D"]