locals {
  tags = merge(var.tags, {tf-module-name = "alb"}, { env = var.env })
}