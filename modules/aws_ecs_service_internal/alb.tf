resource "aws_alb_listener_rule" "http" {
  count        = "${length(var.host_headers)}"
  listener_arn = "${data.terraform_remote_state.load_balancers.alb_internal_listener_http_arn}"
  priority     = "${var.alb_listener_rule_priority + count.index}"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.target_group_service.arn}"
  }

  condition {
    field  = "host-header"
    values = ["${element(var.host_headers,count.index)}"]
  }
}

resource "aws_alb_listener_rule" "https" {
  count        = "${length(var.host_headers)}"
  listener_arn = "${data.terraform_remote_state.load_balancers.alb_internal_listener_https_arn}"
  priority     = "${var.alb_listener_rule_priority + count.index}"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.target_group_service.arn}"
  }

  condition {
    field  = "host-header"
    values = ["${element(var.host_headers,count.index)}"]
  }
}

resource "aws_alb_target_group" "target_group_service" {
  name     = "${var.environment}-${var.service_name}"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${data.terraform_remote_state.base_vpc.vpc_id}"

  health_check {
    path    = "${var.health_check_path}"
    matcher = "${var.health_check_http_success_codes}"
  }

  stickiness {
    type            = "lb_cookie"
    cookie_duration = "${var.alb_stickiness_duration_seconds}"
    enabled         = "${var.alb_stickiness_enabled}"
  }
}
