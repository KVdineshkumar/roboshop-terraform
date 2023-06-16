module "sample1" {
  source = "./ec2"
  name = "sample1"
}

module "sample2" {
  source = "./ec2"
  name = "sample2"

}

output "public_ip_samole1" {
  value = module.sample1.public_ip_address
}

output "public_ip_sample2" {
  value = module.sample2.public_ip_address
}

