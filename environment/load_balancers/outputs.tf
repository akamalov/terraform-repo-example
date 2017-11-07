output "alb_internal_listener_http_arn" {
  value = "${module.alb_internal.listener_http_arn}"
}

output "alb_internal_listener_https_arn" {
  value = "${module.alb_internal.listener_https_arn}"
}

output "alb_internal_security_group_id" {
  value = "${module.alb_internal.security_group_id}"
}
