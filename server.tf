data "aws_ami" "centos" {
  owners             = ["973714476881"]
  most_recent       = true
  name_regex        = "Centos-8-DevOps-Practice"
}
data aws_security_group "allow-all"{
  name = "allow-all"
}

variable "component" {
  default = {
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
}


output "ami" {
  value = data.aws_ami.centos.image_id
}
variable "components" {
  default = ["frontend" , "mongdb", "cart"]
}

resource "aws_instance" "instance" {
  count                  = length(var.components)
  ami                    = "ami-03265a0778a880afb"
  instance_type          =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.components[count.index]
  }
}
/*
output "frontend" {
  value = aws_instance.frontend.public_ip
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z042461937PGA0ROGA0L"
  name    = "frontend-dev.devops71.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
resource "aws_instance" "mongodb" {
  ami           = "ami-03265a0778a880afb"
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "mongodb"
  }
}
resource "aws_route53_record" "mongodb" {
  zone_id = "Z042461937PGA0ROGA0L"
  name    = "mongodb-dev.devops71.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = "ami-03265a0778a880afb"
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "catalogue"
  }
}
resource "aws_route53_record" "catalogue" {
  zone_id = "Z042461937PGA0ROGA0L"
  name    = "catalogue-dev.devops71.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
resource "aws_instance" "redis" {
  ami           = "ami-03265a0778a880afb"
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "redis"
  }
}
resource "aws_route53_record" "redis" {
  zone_id = "Z042461937PGA0ROGA0L"
  name    = "redis-dev.devops71.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
resource "aws_instance" "user" {
  ami           = "ami-03265a0778a880afb"
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "user"
  }
}
resource "aws_route53_record" "user" {
  zone_id = "Z042461937PGA0ROGA0L"
  name    = "user-dev.devops71.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "cart" {
  ami           = "ami-03265a0778a880afb"
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "cart"
  }
}
resource "aws_route53_record" "cart" {
  zone_id = "Z042461937PGA0ROGA0L"
  name    = "cart-dev.devops71.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
resource "aws_instance" "mysql" {
  ami           = "ami-03265a0778a880afb"
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "mysql"
  }
}
resource "aws_route53_record" "mysql" {
  zone_id = "Z042461937PGA0ROGA0L"
  name    = "mysql-dev.devops71.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
resource "aws_instance" "shipping" {
  ami           = "ami-03265a0778a880afb"
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "shipping"
  }
}
resource "aws_route53_record" "shipping" {
  zone_id = "Z042461937PGA0ROGA0L"
  name    = "shipping-dev.devops71.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = "ami-03265a0778a880afb"
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "rabbitmq"
  }
}
resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z042461937PGA0ROGA0L"
  name    = "rabbitmq-dev.devops71.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
resource "aws_instance" "payment" {
  ami           = "ami-03265a0778a880afb"
  instance_type =  var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "payment"
  }
}
resource "aws_route53_record" "payment" {
  zone_id = "Z042461937PGA0ROGA0L"
  name    = "payment-dev.devops71.cloud"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}*/
