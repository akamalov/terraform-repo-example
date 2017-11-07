module "ecs_cluster" {
  source = "./../../modules/aws_ecs_cluster"

  key_name_root           = "${data.terraform_remote_state.base_vpc.key_name_root}"
  environment             = "${var.environment}"
  subnet_ids              = "${data.terraform_remote_state.base_vpc.subnet_ids}"
  vpc_id                  = "${data.terraform_remote_state.base_vpc.vpc_id}"
  alb_security_group_id   = "${data.terraform_remote_state.load_balancers.alb_internal_security_group_id}"
  ssh_allowed_cidr_blocks = "${var.ecs_ssh_allowed_cidr_blocks}"
  max_size                = "${var.ecs_cluster_max_size}"
  desired_size            = "${var.ecs_cluster_desired_size}"
  instance_type           = "${var.ecs_cluster_instance_type}"
  docker_hub_user         = "${file("${path.module}/../../${var.docker_hub_user_file}")}"
  docker_hub_password     = "${file("${path.module}/../../${var.docker_hub_password_file}")}"
  docker_hub_email        = "${file("${path.module}/../../${var.docker_hub_email_file}")}"
}
