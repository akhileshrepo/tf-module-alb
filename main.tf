resource "aws_lb" "main" {
  name               = "${var.env}-alb"
  internal           = var.internal
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.main.id]
  subnets            = var.subnets

  tags = merge(local.tags, { Name = "${var.env}-alb"})
}

resource "aws_security_group" "main" {
  name        = "${var.env}-alb-sg"
  description = "${var.env}-alb-sg"
  vpc_id      = var.vpc_id
  tags = merge(local.tags, { Name = "${var.env}-alb-sg"})

  ingress {
    description = "APP"
    from_port = var.sg_port
    to_port = var.sg_port
    protocol = "tcp"
    cidr_blocks = var.sg_ingress_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
