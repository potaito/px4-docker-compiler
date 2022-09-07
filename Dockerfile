# Dockerfile

FROM px4io/px4-dev-nuttx-focal

# Default arguments
ARG USER=nobody
ARG UID=1000
ARG GID=1000
ARG GIT_NAME="nobody"
ARG GIT_EMAIL="nobody@users.noreply.github.com"

RUN apt update
RUN apt install -y sudo nano neofetch

# User management
RUN groupadd -g $GID $USER \
    && useradd -u $UID -g $GID -ms /bin/bash $USER \
    && usermod -a -G sudo $USER \
    && usermod -a -G users $USER \
    && echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Run as new user from the installation path
USER ${USER}:${GID}

RUN git config --global user.email $GIT_NAME && \
	git config --global user.name $GIT_EMAIL

# Color prompt
RUN echo "PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> ~/.bashrc

# Copy entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/bin/bash"]
