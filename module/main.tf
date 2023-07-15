resource "aws_instance" "instance" {
  ami                    = "ami-03265a0778a880afb"
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.components_name
  }
}

resource "null_resource" "provisioner" {
  depends_on = [aws_instance.instance, aws_route53_record.records]
  for_each     = var.components

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance[each.value["name"]].private_ip
    }

    inline = [
      "rm -rf roboshop-shell",
      "git clone https://github.com/SandeepNainala/roboshop-shell",
      "cd roboshop-shell",
      "sudo bash ${each.value["name"]}.sh ${lookup(each.value,"password", "null")}"
    ]
  }
}

resource "aws_route53_record" "records" {
  for_each  = var.components
  zone_id   = "Z042461937PGA0ROGA0L"
  name      = "${each.value["name"]}-dev.devops71.cloud"
  type      = "A"
  ttl       = 30
  records   = [aws_instance.instance[each.value["name"]].private_ip]
}
