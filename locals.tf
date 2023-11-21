locals {
  tags = merge(var.tags, {tf-module-name = "vpc"}, {env = var.env})
  sg_name = var.internal ? "${var.env}-alb-internal-sg" : "${var.env}-alb-public-sg"  ##NO NEED OF THIS
}