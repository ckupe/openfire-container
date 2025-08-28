#!/bin/env bash
podman build -t openfire:latest -f Containerfile --no-cache .
