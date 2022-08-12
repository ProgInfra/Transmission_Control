# Transmission Control

[![pipeline status](https://gitlab.com/proginfra/transmission_control/badges/main/pipeline.svg)](https://gitlab.com/proginfra/transmission_control/-/commits/main)

![Icon](./icon.png)

## Table Of Contents

- [Transmission Control](#transmission-control)
  - [Table Of Contents](#table-of-contents)
  - [Description](#description)
  - [Getting Started](#getting-started)
  - [Build](#build)
  - [Deploy](#deploy)
  - [Swarm Deployment](#swarm-deployment)
  - [Contributing](#contributing)
  - [Licence](#licence)

## Description

Transmission with VPN support and an advanced Web GUI.

Based on these projects :

- [Transmission OpenVPN by Haugene](https://hub.docker.com/r/haugene/transmission-openvpn)
- [Transmission Web Control by Ronggang](https://github.com/ronggang/transmission-web-control/tree/v1.6.1-update1)

Thanks a lot for these project, I just assemble these two project for get VPN support and advanced Web GUI.

## Getting Started

Docker Compose file : **docker-compose.yml**

    version: '3.6'

    services:
      transmission_control:
        container_name: transmission_control
        image: progower/transmission-control:latest
        privileged: true
        volumes:
        - /etc/localtime:/etc/localtime:ro
        - ./credentials:/config:rw
        - ./config:/data/transmission-home:rw
        - ./download/completed:/data/completed:rw
        - ./download/incomplete:/data/incomplete:rw
        - ./download/watch:/data/watch:rw
        environment:
        - CREATE_TUN_DEVICE=true
        - OPENVPN_PROVIDER=NORDVPN
        - OPENVPN_USERNAME=root@mail.net
        - OPENVPN_PASSWORD=root
        - NORDVPN_COUNTRY=FR
        - NORDVPN_CATEGORY=legacy_p2p
        - WEBPROXY_ENABLED=false
        - LOCAL_NETWORK=192.168.0.0/16
        ports:
        - 9091:9091
        restart: always

**Environment Variables Definition** : For envrionment variable setup, please refer to the good [Transmission OpenVPN by Haugene](https://hub.docker.com/r/haugene/transmission-openvpn) documentation.

You can access it : [Transmission Control](http://localhost:9091)

**Folder Volume Definition** : We have some volume to use our Transmission Control :

- **/etc/localtime** : Time sync
- **/config** : Credentials Config
- **/data/transmission-home** : Transmission Config
- **/data/completed** : Completed downloads
- **/data/incomplete** : Incomplete downloads
- **/data/watch** : Torrent files used (automatically imported)

## Build

    # Docker Build
    docker build -t progower/transmission-control:latest .

    # Docker Compose Build
    docker-compose build

    # Docker Build Multi Arch
    docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t progower/transmission-control:latest --push .

## Deploy

    # Start
    docker-compose up -d

    # Start with rebuild
    docker-compose up -d --build

    # Stop
    docker-compose down

## Swarm Deployment

We can't deploy this service in a **Docker Swarm** or Container Cluster environment because this service need **privileged** access.

## Contributing

See [CONTRIBUTING](./CONTRIBUTING.md) for more information.

## Licence

This project is licensed under the terms of the MIT license.

See [LICENSE](./LICENCE.md) for more information.
