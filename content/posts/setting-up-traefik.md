+++
title = "Using Traefik"
author = ["Arjen Wiersma"]
date = 2024-11-17T12:18:00+01:00
tags = ["development"]
draft = false
+++

I recently came across [Traefik](https://traefik.io/traefik/). It is a reverse proxy built specifically for services in the cloud. I was searching for a convenient (up-to-date) way to expose my project using a reverse proxy within `docker-compose`. I used to use `nginx` for this, but it then requires a generator and an lets encrypt listener (so 3 containers). Traefik only requires a single container and allows you to label your docker containers to apply rules to them.

The below configuration creates a traefik instance, sets it up to host port 80 and 443 for web, and 8080 for its dashboard (protect that port in your firewall). It also sets up `letsencrypt` certificates and automatic redirection from port 80 to 443.

```dockerfile
version: '3'

services:
  reverse-proxy:
    image: traefik:v3.1
    ports:
      - "80:80"
      - "443:443"
      - "8080:8080"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./traefik.yml:/traefik.yml:ro # Traefik config file
      - traefik-certs:/certs # Docker volume to store the acme file for the Certifactes

  app:
    image: your/image
    ports:
      - 8081:8080
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app-http.rule=Host(`example.com`) || Host(`www.example.com`)"
      - "traefik.http.routers.app-http.entrypoints=web"
      - "traefik.http.routers.app-http.middlewares=redirect-to-https"
      - "traefik.http.routers.app-https.rule=Host(`example.com`) || Host(`www.example.com`)"
      - "traefik.http.routers.app-https.entrypoints=websecure"
      - "traefik.http.routers.app-https.tls=true"
      - "traefik.http.routers.app-https.tls.certresolver=letencrypt"
      - "traefik.http.middlewares.redirect-to-https.redirectscheme.scheme=https"
      - "traefik.http.middlewares.redirect-to-https.redirectscheme.permanent=true"
volumes:
  traefik-certs:
    name: traefik-certs
```

The mentioned config file is reproduced below:

```nil
api:
  dashboard: true # Optional can be disabled
  insecure: true # Optional can be disabled
  debug: false # Optional can be Enabled if needed for troubleshooting
entryPoints:
  web:
    address: ":80"
  websecure:
    address: ":443"
serversTransport:
  insecureSkipVerify: true
providers:
  docker:
    endpoint: "unix:///var/run/docker.sock"
    exposedByDefault: false
    network: proxy # Optional; Only use the "proxy" Docker network, even if containers are on multiple networks.
certificatesResolvers:
  letencrypt:
    acme:
      email: contact@example.com
      storage: /certs/acme.json
      #caServer: https://acme-v02.api.letsencrypt.org/directory # prod (default)
      caServer: https://acme-staging-v02.api.letsencrypt.org/directory # staging
      httpChallenge:
        entryPoint: web
```
