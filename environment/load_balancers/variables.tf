#----
# Core
#----
# The environment to tag resources with
variable "environment" {}

#----
# Load Balancers
#----

# The ip address blocks allowed to hit the internal load balancer on http
variable "alb_internal_http_allowed_cidr_blocks" {
  type    = "list"
  default = []
}

# The ip address blocks allowed to hit the internal load balancer on https
variable "alb_internal_https_allowed_cidr_blocks" {
  type    = "list"
  default = []
}

# The https certificate body file
variable "alb_internal_certificate_body_file" {}

# The https certificate private key file
variable "alb_internal_certificate_private_key_file" {}

# The https certificate chain file
variable "alb_internal_certificate_chain_file" {}
