data "aws_ami" "centos" {
  owners           = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
}
data "aws_security_group" "allow-all" {
  name = "allow-all"
}

variable "instance_type"{
  default = "t3.small"
}

variable "component" {
  default = ["frontend","Mongodb","catalogue"]

}

resource "aws_instance" "instance" {
  count         = length(var.component)
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]

  tags = {
    Name = var.component[count.index]
  }
}