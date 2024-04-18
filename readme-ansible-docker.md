## How to build

This is only necessary when we need to update the Ansible version of our image.

```bash
VERSION="6.6.0-1ppa~jammy"
docker build --build-arg ansible_version="${VERSION}" -f Dockerfile -t systemteam_ansible:${VERSION//[A-z~]/}  .
```

