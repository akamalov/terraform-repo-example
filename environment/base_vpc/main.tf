# Create the base VPC this environment will be placed in.
module "aws_vpc" {
  source                = "./../../modules/aws_vpc"
  environment           = "${var.environment}"
  vpc_cidr_block_prefix = "${var.vpc_cidr_block_prefix}"
}

# Create a key pair to use in this environment
resource "aws_key_pair" "root" {
  key_name   = "${var.environment}_root_key"
  public_key = "${var.aws_keypair_sshkey_thumbprint}"
}
