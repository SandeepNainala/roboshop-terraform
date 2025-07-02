locals {
  vpc_id = lookup(lookup(module.vpc, "main", null), "vpc_id", null)  # Fallback to null if vpc_id is not found looking for "main" key
  tags = {
    business_unit = "ecommerce"
    business_type = "retail"
    project       = "ecommerce-platform"
    owner         = "devops-team"
    env           = var.env
    cost_center   = 100
  }
}