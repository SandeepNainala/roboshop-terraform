
output "ami" {
  value = data.aws_ami.centos.image_id
}


/*
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

