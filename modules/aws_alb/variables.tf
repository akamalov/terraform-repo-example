# The environment to tag resources with
variable "environment" {}

# The name of the ALB to create (will be prefixed with the environment)
variable "alb_name" {}

# A list of subnet ids to add the load balancer to.
variable "subnet_ids" {
  type = "list"
}

# The VPC to create the load balancer in.
variable "vpc_id" {}

# IP address ranges to allow access to the load balancer
variable "http_allowed_cidr_blocks" {
  type = "list"
}

variable "https_allowed_cidr_blocks" {
  type = "list"
}

# The certificate body to use for HTTPS
variable "certificate_body" {}

# The private key for the certificate
variable "certificate_private_key" {}

# The certificate chain
variable "certificate_chain" {}

# Whether the ALB should be internal or not
variable "internal" {
  default = true
}
