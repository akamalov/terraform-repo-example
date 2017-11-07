resource "aws_security_group" "ecs" {
  name        = "${var.environment}_${var.state_id}_ecs"
  description = "ECS Security Group"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}_ecs"
    environment = "${var.environment}"
  }
}

resource "aws_security_group_rule" "lb_to_ecs" {
  type                     = "ingress"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "TCP"
  source_security_group_id = "${var.alb_internal_security_group_id}"
  security_group_id        = "${aws_security_group.ecs.id}"
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = ["${compact(var.ssh_allowed_cidr_blocks)}"]
  security_group_id = "${aws_security_group.ecs.id}"
}

resource "aws_security_group_rule" "out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ecs.id}"
}
