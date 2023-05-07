
resource "aws_instance" "instance" {
  for_each = var.component
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = each.value["name"]
  }
}

resource "aws_route53_record" "records" {
  for_each = var.component
  zone_id = "Z07551482ORWS1T3ML489"
  name    = "${each.value["name"]}-dev.devops71.cloud"
  type    = "A"
  ttl     = 5
  records = [aws_instance.instance[each.value["name"]].private_ip]

}