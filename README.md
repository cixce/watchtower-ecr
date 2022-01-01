# watchtower-ecr

Build of watchtower with aws ecr helper included.
Based on the directions here: https://containrrr.dev/watchtower/private-registries/#credential_helper
but altered to build and be usable with out manual setup on every system

${HOME}/.docker/config.json

```
{
   "credsStore" : "ecr-login",
   "HttpHeaders" : {
     "User-Agent" : "Docker-Client/19.03.1 (XXXXXX)"
   },
   "auths" : {
     "<AWS_ACCOUNT_ID>.dkr.ecr.<REGION>.amazonaws.com" : {}
   },
   "credHelpers": {
     "<AWS_ACCOUNT_ID>.dkr.ecr.<REGION>.amazonaws.com" : "ecr-login"
   }
}
```

docker-compose.yaml

```
version: "3.4"
services:
 watchtower:
  image: containrrr/watchtower
  volumes:
    - /root/.docker/config.json:/config.json
    - /var/run/docker.sock:/var/run/docker.sock
  command: --interval 30 --cleanup <CONTAINER>
  restart: unless-stopped
  logging:
      driver: "json-file"
      options:
          max-file: "5"
          max-size: 1m
```
