terraform {
  backend "s3" {
    bucket = "terraform-bb73"
    key = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}
output "demo" {
  value = "hello world"
}