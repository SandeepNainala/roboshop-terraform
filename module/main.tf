resource "aws_instance" "instance" {
  ami                    = "ami-03265a0778a880afb"
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.component_name
  }
}

resource "null_resource" "provisioner" {
  depends_on = [aws_instance.instance, aws_route53_record.records]
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
     inline = var.app_type == "db" ? local.db_commands : local.app_commands
  }
}

resource "aws_iam_role" "role" {
  name = "${var.component_name}-${var.env}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "${var.component_name}-${var.env}-role"
  }
}

resource "aws_route53_record" "records" {
  zone_id   = "Z042461937PGA0ROGA0L"
  name      = "${var.component_name}-dev.devops71.cloud"
  type      = "A"
  ttl       = 30
  records   = [aws_instance.instance.private_ip]
}
