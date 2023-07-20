env = "dev"

tags = {
  company_name  = "XYZ Tech"
  business      = "ecommerce"
  business_unit = "retail"
  cost_center   = "322"
  project_name  = "roboshop"
}

vpc = {
  main = {
    cidr_block= "10.0.0.0/16"
    subnets = {
      web      = { cidr_block = [ "10.0.0.0/24", "10.0.1.0/24" ] }
      app      = { cidr_block = [ "10.0.2.0/24", "10.0.3.0/24" ] }
      db       = { cidr_block = [ "10.0.4.0/24", "10.0.5.0/24" ] }
      public   = { cidr_block = [ "10.0.6.0/24", "10.0.7.0/24" ] }
    }
  }
}

default_vpc_id = "vpc-0ff78cc5f1fd06917"
default_vpc_rt = "rtb-0db7d62f9bd2afea3"
allow_ssh_cidr = ["172.31.6.204/32"]
zone_id        = "Z08427681QR9BSPPMJC53"
kms_key_id     = "f437aee2-3529-4431-9c1b-3492cba74634"
kms_key_arn    = "arn:aws:kms:us-east-1:833241119429:key/f437aee2-3529-4431-9c1b-3492cba74634"

rabbitmq = {
  main = {
    instance_type = "t3.small"
    component     = "rabbitmq"
  }
}

rds = {
  main = {
    component               = "rds"
    engine                  = "aurora-mysql"
    engine_version          = "5.7.mysql_aurora.2.11.3"
    db_name                 = "dummy"
    instance_count          = 1
    instance_class          = "db.t3.small"
  }
}