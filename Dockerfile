FROM all-officialdfy-docker.artifactory.si.francetelecom.fr/ubuntu:22.04

ARG ansible_version

LABEL org.opencontainers.image.authors="coinfra.system.team@list.hebex.orangeportails.net" \
  org.opencontainers.image.description="Ansible Base" \
  org.opencontainers.image.documentation="This is ansible standardized image" \
  org.opencontainers.image.source="https://gitlab.si.francetelecom.fr/ipsdgp/sys/run/systemteam_ansible" \
  org.opencontainers.image.title="Ansible Base" \
  org.opencontainers.image.url="https://gitlab.si.francetelecom.fr/ipsdgp/sys/run/systemteam_ansible" \
  org.opencontainers.image.vendor="coinfra.system.team@list.hebex.orangeportails.net" \
  org.opencontainers.image.version="${ansible_version}"

RUN echo "deb [arch=amd64] https://artifactory.si.francetelecom.fr/ext-ppa-ansible-debian/ansible-6/ubuntu jammy main" > /etc/apt/sources.list.d/AF_ansibleppa.list \
    && curl https://webadmin.artifactory.orangeportails.net/install_gpg_key/93C4A3FD7BB9C367 | sh \
    && apt -qq update \
    && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y ansible=${ansible_version} ansible-lint yamllint sshpass openssh-client git jq vim python3-requests \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

WORKDIR /work


