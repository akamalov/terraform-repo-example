module "alb_internal" {
  source = "./../../modules/aws_alb"

  environment               = "${var.environment}"
  alb_name                  = "internal"
  subnet_ids                = "${data.terraform_remote_state.base_vpc.subnet_ids}"
  vpc_id                    = "${data.terraform_remote_state.base_vpc.vpc_id}"
  http_allowed_cidr_blocks  = "${var.alb_internal_http_allowed_cidr_blocks}"
  https_allowed_cidr_blocks = "${var.alb_internal_https_allowed_cidr_blocks}"
  certificate_body          = "${file("${path.module}/../../../${var.alb_internal_certificate_body_file}")}"
  certificate_private_key   = "${file("${path.module}/../../../${var.alb_internal_certificate_private_key_file}")}"
  certificate_chain         = "${file("${path.module}/../../../${var.alb_internal_certificate_chain_file}")}"
}
