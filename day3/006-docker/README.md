Docker with terraform
=====================

Take a look a the Docker open port on your deamon.

`telnet 127.0.0.1 1234`

If you find that your Docker API port is close for security purpose on your
computer, you can open the docker API, `make open-docker-api`

Then, take a look at [nginx.tf](./nginx.tf) file and apply start an nginx
container. `terraform apply`!

And check, `curl http://localhost:80` to see  your running web server alive!

Resources
------

- [Ruby Docker API](https://github.com/swipely/docker-api)
- [Other Docker SDKs](https://docs.docker.com/develop/sdk/#unofficial-libraries)
