module "back_end_ecs_service" {
  source                     = "git@github.com:dave-pollock/terraform-repo-example//modules//aws_ecs_service_internal"
  service_name               = "${var.service_name}"
  host_headers               = ["${var.service_name}.${var.environment}.mydomain.com"]
  service_port               = "8080"
  desired_count              = "2"
  environment                = "${var.environment}"
  task_definition            = "${data.template_file.task_definition.rendered}"
  alb_listener_rule_priority = "1"
  health_check_path          = "/healthcheck"
}

data "template_file" "task_definition" {
  template = "${file("${path.module}/taskdefinition.json")}"

  vars {
    image_tag     = "${var.image_tag}"
    image_name    = "${var.service_name}"
    build_version = "${var.build_version}"
    environment   = "${var.environment}"
  }
}
