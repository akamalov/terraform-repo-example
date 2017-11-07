# Create the security group which defines the network traffic allowed to and
# from the load balancer.
# Note: We create a security group even if enabled is turned off, because
# we need to output the security group id. If the output is null then terraform
# can't handle us using it as input for other modules without breaking.
resource "aws_security_group" "alb" {
  name        = "${var.environment}_alb_${var.alb_name}"
  description = "Load balancer security group"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "${var.environment}_alb_${var.alb_name}"
    environment = "${var.environment}"
  }

  # No rules are defined here as we have to seperate them out so that

  # they aren't overwritten by the seperate rule resources below.
}

# Create security group rules to add to the security groups
# https://www.terraform.io/docs/providers/aws/r/security_group_rule.html
resource "aws_security_group_rule" "load_balancer_http" {
  # Allow HTTP traffic
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = "${var.http_allowed_cidr_blocks}"
  security_group_id = "${aws_security_group.alb.id}"
}

resource "aws_security_group_rule" "load_balancer_https" {
  # Allow HTTPS traffic
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "TCP"
  cidr_blocks       = "${var.https_allowed_cidr_blocks}"
  security_group_id = "${aws_security_group.alb.id}"
}

resource "aws_security_group_rule" "load_balancer_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.alb.id}"
}
