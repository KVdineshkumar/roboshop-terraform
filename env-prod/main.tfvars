env = "prod"
components = {

  frontend = {}
  mongodb = {}
  catalogue = {}
  redis = {}
  user = {}
  cart = {}
  mysql = {}
  shipping = {}
  rabbitmq = {}
  payment = {}

}

tags = {
  company_name  = "XYZ Tech"
  business      = "ecommerce"
  business_unit = "retail"
  cost_center   = "322"
  project_name  = "roboshop"
}


vpc = {
  main = {
    cidr_block= "10.20.0.0/16"
  }
}