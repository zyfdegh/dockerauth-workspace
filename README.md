# dockerauth-workspace
Configs, certs files to start an example secure(SSL) docker registry with authn & authz.

# Prerequisites
Linux (CentOS 7 recommended)
Docker (1.12+ recommended)
Docker Compose (1.8+ recommended)

# Build

Directory structure of this repo.

```sh
.
├── config
│   └── auth_config.yml
├── docker-compose.yml
├── generate-cert.sh
├── logs
├── README.md
├── registry
│   ├── conf
│   │   └── config.yml
│   └── data
└── ssl
    ├── registry.key
    ├── registry.pem
    ├── server.key
    └── server.pem
```

## Re-generate certs
IMPORTANT: If you use in production, replace certs under `ssl/` is strongly essential.
Otherwise, your private registry will be in danger.

Generate 2 pairs of certs, one pair for auth server(ssl/server.pem, ssl/server.key), 
another(ssl/registry.pem, ssl/registry.key) for docker registry.
```sh
./generate-cert.sh
```
The hostname must be IP or domain name of your registry.

## Re-configure

`config/auth_config.yml` is the config file for [zyfdegh/docker_auth][4], the original fork is [cesanta/docker_auth][3]

`registry/conf/config.yml` is the config file for docker registry.

`docker-compose.yml` is the docker compose file.

If you changed any IP, issuer, certs files path, or config file path in `auth_config.yml`, then it's needed to 
change related docker registry config and docker compose file.

## Run
```sh
docker-compose up
```

## Check

### Postman
Check if user is authn with Postman.

Postman may be blocked before access an self-signed SSL site.
See how to [solve][6].

```sh
GET
https://192.168.10.187:5001/auth?account=admin&client_id=docker&offline_token=true&service=my.docker.registry

Basic Auth
admin
linker
```

### docker login
Before `docker login`, edit docker service file, add the following 
```sh
--insecure-registry 192.168.10.187:5000
```
Otherwise, an `x509` error will occur.

```sh
docker login 192.168.10.187:5000
Username: admin
Password: linker
```

# References
[zyfdegh/mockauthserver][5]: Source code of mock auth server.

[docker-registry-setup][1]: Another repo on how to config auth server with LDAP.

[Creating Private Docker Registry 2.0 with Token...][2]: Main referenced article(blog).

[1]: https://github.com/kwk/docker-registry-setup
[2]: https://the.binbashtheory.com/creating-private-docker-registry-2-0-with-token-authentication-service/
[3]: https://github.com/cesanta/docker_auth
[4]: https://github.com/zyfdegh/docker_auth
[5]: https://github.com/zyfdegh/mockauthserver
[6]: http://blog.getpostman.com/2014/01/28/using-self-signed-certificates-with-postman/
