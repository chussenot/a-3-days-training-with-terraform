# Template for initial configuration bash script

variable "message" {
  default = "Hello World!"
}

data "template_file" "message" {
  template = "${file("message.tpl.json")}"

  vars {
    message = "${var.message}"
  }
}

output "json" {
  value = "${data.template_file.message.rendered}"
}
