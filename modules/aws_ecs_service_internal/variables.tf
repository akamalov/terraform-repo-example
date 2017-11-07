# The environment to tag resources with
variable "environment" {}

# The host header/s to use to direct traffic to this service
variable "host_headers" {
  type = "list"
}

# The name of the service to create
variable "service_name" {}

# The port the service will listen on
variable "service_port" {}

# The json definition of the task
variable "task_definition" {}

# The number of instances of the service to run
variable "desired_count" {}

# The max percentage of total containers which can be running during deployments
# For example, if there are 2 containers and this value is 200, then 4 total
# containers will be allowed to be running during deployment.
variable "deployment_maximum_percent" {
  default = "200"
}

# The mimimum percentage of total containers which can be running during deployments.
# For example, if there are 2 containers and this value is 50, then ECS is allowed
# to stop one container while it brings another one up.
variable "deployment_minimum_healthy_percent" {
  default = "50"
}

# The priority to set the ALB listener rule to. This number must be unique among
# all rules on the same listener.
variable "alb_listener_rule_priority" {}

# The path to use for the health check
variable "health_check_path" {
  default = "/"
}

# The http status codes which mean that the service is healthy
variable "health_check_http_success_codes" {
  default = "200"
}

variable "alb_stickiness_duration_seconds" {
  default = "86400"
}

variable "alb_stickiness_enabled" {
  default = "false"
}
