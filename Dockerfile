FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME=vscode
ARG UID=1000
ARG GID=${UID}

ENV HOME=/home/${USERNAME}

RUN apt update \
    && apt -y install --no-install-recommends \
    ca-certificates \
    curl \
    locales \
    sudo \
    git

RUN apt update \
    && apt -y install --no-install-recommends \
    texlive-science \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-fonts-recommended

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN groupadd --gid ${GID} ${USERNAME} \
    && useradd -s /bin/bash --uid ${UID} --gid ${GID} -m ${USERNAME} \
    && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && chmod 0440 /etc/sudoers.d/${USERNAME} \
    && chown ${USERNAME}:${USERNAME} ${HOME}

ENV TZ UTC

RUN sudo rm -rf /var/lib/apt/lists/* \
    && curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh | bash || true

COPY --chown=${USERNAME}:${USERNAME} ./config/.bashrc ${HOME}/.bashrc

ENV DEBIAN_FRONTEND=dialog

CMD ["bash"]
