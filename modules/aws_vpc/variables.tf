# The environment to tag resources with
variable "environment" {}

# The first two octets of the VPC to create. Should be "10.x" where x
# is a number unused by any other VPCs.
variable "vpc_cidr_block_prefix" {}
