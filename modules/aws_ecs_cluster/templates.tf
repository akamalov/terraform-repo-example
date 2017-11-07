data "template_file" "ecs_config" {
  template = "${file("${path.module}/resources/ecs.config")}"

  vars {
    ecs_cluster_name    = "${aws_ecs_cluster.ecs_cluster.name}"
    docker_hub_user     = "${var.docker_hub_user}"
    docker_hub_password = "${var.docker_hub_password}"
    docker_hub_email    = "${var.docker_hub_email}"
  }
}
