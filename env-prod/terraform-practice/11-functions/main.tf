variable "class" {
  default = "devops"
}

## Print the same in capital letters
output "class" {
  value = upper(var.class)
}
variable "fruits" {
  default = [ "Apple", "Banana", "orange"]
}
output "fruit_count" {
  value = length(var.fruits)
}
variable "classes" {
  default = {
    devops = {
      name = "devops"
      topics = ["jenkins", "docker"]
    }
    aws = {
      name = "aws"

    }

  }
}
output "devops_topics" {
  value = var.classes["devops"]["topics"]
}
output "aws" {
  value = var.classes["aws"]
}
output "aws_topics" {
  value = lookup(lookup(var.classes, "aws", null ),"topics", "No Topics So far" )
}
output "fruit_0" {
  value = var.fruits[0]
}
output "fruit_4" {
  value = element(var.fruits, 4)
}