variable "sample" {
  default = 100
}

variable "sample1" {
  default = "Hello World"
}
output "sample1_var" {
  value = var.sample1
}
output "sample_var" {

  value = var.sample
}
## Sometime if varaible/any reference with combination of some other string then we want to access those in ${}
output "sample-ext" {
  value = "Value od sample - ${var.sample} - ${var.sample1}"
}
#Varaible data types
# 1. String
# 2. Number
# 3. Boolean

# variable type
# In Ansible - 1.Plain Key,value 2.List 3.Map/dict

# In Terraform
# 1. Plain
# 2. List
# 3. Map

# plain
variable "course" {
  default = "devOps Training"
}
# List
variable "courses" {
  default = [
  "DevOps",
  "AWS",
  "Python"
  ]
}
#Map
variable "course_details" {
  default =  {
    DevOps = {
      name  = "DevOps"
      timing  = "10am"
      duration  = 90
    }
    AWS= {
      name = "AWS"
      timing  = "11am"
      duration  = 30
    }
  }
}
output "course" {
  value = var.course
}
#output "courses" {
 # value = var.courses
#}
output "courses" {
  value = var.courses[2]
}
#output "course_details" {
#  value = var.course_details
#}
output "course_details" {
  value = var.course_details["DevOps"]
}
variable "env" {}
output "env" {
  value = var.env
}
