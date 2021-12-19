FROM ubuntu

COPY ./src/install_docker_root.sh /

RUN bash /install_docker_root.sh

COPY ./src/install_docker_user.sh /
COPY ./src/authorized_keys_docker /

USER dhuni

RUN bash /install_docker_user.sh

EXPOSE 22

CMD ["sudo", "/usr/sbin/sshd", "-D"]
