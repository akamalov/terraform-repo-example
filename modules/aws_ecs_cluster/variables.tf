# The environment to tag resources with
variable "environment" {}

# The instance type to use when creating the cluster instances
variable "instance_type" {
  default = "t2.micro"
}

# The name of the keypair to attach to the instances.
variable "key_name_root" {}

# The VPC to create the cluster in
variable "vpc_id" {}

# A list of subnets to add the cluster instances to
variable "subnet_ids" {
  type = "list"
}

# The minimum number of nodes to run in the ecs cluster
variable "min_size" {
  default = 1
}

# The maximum number of nodes to allow the ecs cluster to grow to
variable "max_size" {
  default = 3
}

# The number of nodes to run normally
variable "desired_size" {
  default = 1
}

# The security group id of the load balancer
variable "alb_security_group_id" {
  default = ""
}

# The ip address blocks to allow ssh access
variable "ssh_allowed_cidr_blocks" {
  type = "list"
}

# The username to authenticate with docker hub
variable "docker_hub_user" {}

# The password to authenticate with docker hub
variable "docker_hub_password" {}

# The email address for the docker hub account
variable "docker_hub_email" {}
