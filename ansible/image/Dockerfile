FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ARG DEGIAN_FRONTEND=noninteractive

ARG UID=11000
ARG GID=11000

RUN apt-get -qqy update &&\
    apt-get -qqy install \
      ca-certificates \
      sudo \
      python3.11 \
      python3.11-venv \
      git \
      openssh-client &&\
    python3.11 -m venv /opt/ansible &&\
    addgroup --gid $GID ansible &&\
    adduser --uid $UID --gid $GID --home /ansible --disabled-password --gecos "" ansible &&\
    echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers &&\
    mkdir -p /etc/ansible &&\
    mkdir -p /etc/ansible/roles &&\
    mkdir -p /etc/ansible/collections &&\
    chown $UID:$GID -R /ansible /etc/ansible /opt/ansible

COPY ansible.cfg /etc/ansible/ansible.cfg

USER ansible

ARG PATH="/opt/ansible/bin:$PATH"
ENV PATH="/opt/ansible/bin:$PATH"

RUN python -m pip install --upgrade pip &&\
    python -m pip install ansible-lint yamllint &&\
    ansible-galaxy collection install community.general &&\
    ansible-galaxy collection install ansible.utils &&\
    ansible-galaxy role install geerlingguy.docker &&\
    mkdir -p /ansible/.ssh &&\
    chmod 0700 /ansible/.ssh

COPY --chown=$UID:$GID ansible_key /ansible/.ssh/id_ed25519
COPY --chown=$UID:$GID ansible_key.pub /ansible/.ssh/id_ed25519.pub

RUN chmod 0600 /ansible/.ssh/id_ed25519 &&\
    chmod 0644 /ansible/.ssh/id_ed25519.pub

ENTRYPOINT ["bash"]
