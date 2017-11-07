#----
# Core
#----
# The environment to tag resources with
variable "environment" {}

#----
# ECS cluster
#----
variable "ecs_cluster_max_size" {}

variable "ecs_cluster_desired_size" {}

variable "ecs_cluster_instance_type" {}

variable "docker_hub_user_file" {}

variable "docker_hub_password_file" {}

variable "docker_hub_email_file" {}

variable "ecs_ssh_allowed_cidr_blocks" {
  type    = "list"
  default = []
}
