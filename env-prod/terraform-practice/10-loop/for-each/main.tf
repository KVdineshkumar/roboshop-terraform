resource "aws_instance" "web" {
  //count = length(var.instances)
  for_each = var.instances
  ami           = data.aws_ami.example.id
  instance_type = lookup(each.value, "instance_type", "t3.small" )

  tags = {
    Name = "hello"
  }
}

data "aws_ami" "example" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}
variable "instances" {
  default = {
    frontend = {
      name = "frontend"

    }
    cart = {
      name = "cart"
      instance_type = "t3.nano"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.nano"
    }

  }
}

