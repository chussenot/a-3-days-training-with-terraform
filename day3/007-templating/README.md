Templating with terraform
==========

Dependencies & Pre-requisites
-----------------------------

- [make](https://en.wikipedia.org/wiki/Make_(software))

**Makefiles** are a simple way to organize commands, to see this project useful
system commands run `make help`

Usage
-----

```
terraform init
terraform apply
terraforn output json | jq
```

You should return a valid json data structure

```
$ terraform output json | jq
{
  "message": "Hello World!"
}
```

And you can override your default variable,

```
$ terraform apply -var message=Yo!
data.template_file.message: Refreshing state...

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

json = {
  "message": "Yo!"
}
```

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
