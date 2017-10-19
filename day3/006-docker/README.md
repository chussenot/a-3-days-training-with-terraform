Docker with terraform
=====================

Take a look a the Docker open port on your deamon.

`telnet 127.0.0.1 1234`

If you find that your Docker API port is close for security purpose on your
computer, you can open the docker API, `make open-docker-api`

Then, take a look at [main.tf](./main.tf) file and apply start an nginx
container. `terraform apply`!

And check, `curl http://localhost:80` to see  your running web server alive!

Resources
------

- [Ruby Docker API](https://github.com/swipely/docker-api)
- [Other Docker SDKs](https://docs.docker.com/develop/sdk/#unofficial-libraries)
Dependencies & Pre-requisites
-----------------------------

- [make](https://en.wikipedia.org/wiki/Make_(software))

Usage
-----

**Makefiles** are a simple way to organize commands, to see this project useful
system commands run `make help`

Technical notes
---------------

The following summarises some important technical considerations:

Must-Read Sources
-----------------

Contributing
------------

If you find bugs or want to improve the documentation, please feel free to
contribute!

Happy coding!
