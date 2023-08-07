module  "vpc" {
    source = "git::https://github.com/SandeepNainala/tf-module-vpc.git"

    for_each   = var.vpc
    cidr_block = each.value["cidr_block"]
    subnets    = each.value["subnets"]
    tags       = local.tags
    env        = var.env
}

module "app" {
    source = "git::https://github.com/SandeepNainala/tf-module-app.git"

    for_each = var.app
    instance_type = each.value["instance_type"]
    name          = each.value["name"]
    desired_capacity = each.value["desired_capacity"]
    max_size         = each.value["max_size"]
    min-size         = each.value["min_size"]

    env = var.env
    bastion_cidrs = var.bastion_cidrs

    subnet_ids     = element(lookup(lookup(lookup(lookup(module.vpc, "main", null),"subnets",null), each.value["subnet_name"], null), "subnet_cidrs", null),0 )

    vpc_id = lookup(lookup(module.vpc, "main", null ), "vpc_id", null)

}




