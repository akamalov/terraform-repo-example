#----
# Core
#----
# The environment to tag resources with
variable "environment" {}

#--------------
# Networking
#--------------
# The first two octets of the VPC to create. Should be "10.x" where x
# is a number unused by any other VPCs.
variable "vpc_cidr_block_prefix" {}

#----
# Security
#----
# The public SSH key used to create the key pair for this environment
variable "aws_keypair_sshkey_thumbprint" {}
