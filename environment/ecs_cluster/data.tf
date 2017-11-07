data "aws_caller_identity" "current" {}

data "aws_region" "current" {
  current = true
}

data "terraform_remote_state" "base_vpc" {
  backend = "s3"

  config {
    bucket = "${data.aws_caller_identity.current.account_id}-terraform-state"
    key    = "${var.environment}/base_vpc/state.tfstate"
    region = "${data.aws_region.current.name}"
  }
}

data "terraform_remote_state" "load_balancers" {
  backend = "s3"

  config {
    bucket = "${data.aws_caller_identity.current.account_id}-terraform-state"
    key    = "${var.environment}/load_balancers/state.tfstate"
    region = "${data.aws_region.current.name}"
  }
}
