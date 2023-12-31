module "vpc" {
  source = "git::https://github.com/KVdineshkumar/tf-module-vpc.git"
  for_each = var.vpc
  cidr_block = each.value["cidr_block"]
  subnets = each.value["subnets"]
  env = var.env
  tags = var.tags
  default_vpc_id = var.default_vpc_id
  default_vpc_rt = var.default_vpc_rt
}

module "app_server" {
  source    = "git::https://github.com/KVdineshkumar/tf-module-app.git"
  env       = var.env
  tags      = var.tags
  component = "test"
  subnet_id = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnet_ids", null), "app", null), "subnet_ids", null)[0]
  vpc_id    = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
}
module "rabbitmq" {
  source    = "git::https://github.com/KVdineshkumar/tf-module-rabbitmq.git"

  for_each      = var.rabbitmq
  component     = each.value["component"]
  instance_type = each.value["instance_type"]
  sg_subnet_cidr= lookup(lookup(lookup(lookup(var.vpc, "main", null ), "subnets",null), "app", null), "cidr_block", null)
  vpc_id        = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
  subnet_id     = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnet_ids", null), "db", null), "subnet_ids", null)[0]
  env            = var.env
  tags           = var.tags
  allow_ssh_cidr = var.allow_ssh_cidr
  zone_id        = var.zone_id
  kms_key_id    = var.kms_key_id

}

#module "rds" {
#  source = "git::https://github.com/KVdineshkumar/tf-module-rds.git"
#  for_each       = var.rds
#  component      = each.value["component"]
#  engine         = each.value["engine"]
#  engine_version = each.value["engine_version"]
#  db_name        = each.value["db_name"]
#  subnet_ids     = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnet_ids", null), "db", null), "subnet_ids", null)
#  instance_count = each.value["instance_count"]
#  instance_class = each.value["instance_class"]
#  vpc_id        = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
#  sg_subnet_cidr= lookup(lookup(lookup(lookup(var.vpc, "main", null ), "subnets",null), "app", null), "cidr_block", null)
#
#
#
#
#  tags           = var.tags
#  env            = var.env
#  kms_key_arn     = var.kms_key_arn
#}
module "documentdb" {
  source = "git::https://github.com/KVdineshkumar/tf-module-documentdb.git"
  for_each       = var.documentdb
  component      = each.value["component"]
  subnet_ids     = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnet_ids", null), "db", null), "subnet_ids", null)
  engine_version    = each.value["engine_version"]




  tags           = var.tags
  env            = var.env
  kms_key_arn     = var.kms_key_arn
  sg_subnet_cidr= lookup(lookup(lookup(lookup(var.vpc, "main", null ), "subnets",null), "app", null), "cidr_block", null)

}
#module "elasticache" {
#  source = "git::https://github.com/KVdineshkumar/tf-module-elasticache.git"
#  for_each       = var.rds
#
#  tags           = var.tags
#  env            = var.env
#  kms_key_arn     = var.kms_key_arn
#  sg_subnet_cidr= lookup(lookup(lookup(lookup(var.vpc, "main", null ), "subnets",null), "app", null), "cidr_block", null)
#
#}

