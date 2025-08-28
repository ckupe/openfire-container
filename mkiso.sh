#!/bin/env bash
podman image save --format oci-archive -o openfire/openfire.tar quay.io/ckuperst/openfire:5.0.1
mkisofs -LJ -o openfire-container.iso openfire/
