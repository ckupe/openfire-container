[![Docker Repository on Quay](https://quay.io/repository/ckuperst/openfire/status "Docker Repository on Quay")](https://quay.io/repository/ckuperst/openfire)
# openfire container

Created this quickly for a client that needed to install openfire chat server on RHEL.

# Create ISO

```
./mkiso.sh
```

- Downloads prebuilt image from Quay
- Saves image to local folder in openfire/
- generates ISO from the openfire/ directory contents

# Install

- Mount the ISO
- Run as an unprivileged user from terminal:

```
./install.sh
```

- loads container image from disk into cache
- Puts a podman quadlet file in ~/.config/containers/systemd/openfire.container
- starts service with `systemctl --user start openfire`
