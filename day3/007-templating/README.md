Templating with terraform
==========

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
