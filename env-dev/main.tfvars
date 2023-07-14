components = {
  frontend = {
    name          = "frontend"
    instance_type = "t2.small"
  }
  mongodb = {
    name          = "mongodb"
    instance_type = "t2.small"
  }
  catalogue = {
    name          = "catalogue"
    instance_type = "t2.small"
  }
  redis = {
    name          = "redis"
    instance_type = "t2.small"
  }
  user = {
    name          = "user"
    instance_type = "t2.small"
  }
  mysql = {
    name          = "mysql"
    instance_type = "t2.small"
  }
  cart = {
    name          = "cart"
    instance_type = "t2.small"
  }
  shipping = {
    name          = "shipping"
    instance_type = "t2.small"
  }
  rabbitmq = {
    name          = "rabbitmq"
    instance_type = "t2.small"
  }
}

env = "dev"