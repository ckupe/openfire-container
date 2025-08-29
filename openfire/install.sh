#!/bin/env bash
mkdir -p $HOME/.config/containers/systemd
loginctl enable-linger
podman load -i $(pwd)/openfire.tar

cat <<EOF >$HOME/.config/containers/systemd/openfire.container
[Container]
Annotation=io.podman.annotations.userns=keep-id:uid=1000,gid=1000
PublishPort=5222:5222
PublishPort=5223:5223
PublishPort=5269:5269
PublishPort=5270:5270
PublishPort=7070:7070
PublishPort=7443:7443
PublishPort=9090:9090
PublishPort=9091:9091
Image=quay.io/ckuperst/openfire:latest
ContainerName=openfire
Mount=type=volume,src=openfire-database,destination=/opt/openfire/embedded-db
Mount=type=volume,src=openfire-conf,destination=/opt/openfire/conf

[Service]
Restart=always
EOF

systemctl --user daemon-reload
systemctl --user start openfire
