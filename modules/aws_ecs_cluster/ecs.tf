resource "aws_launch_configuration" "ecs_cluster" {
  name                        = "${var.environment}_ecs_launch_config"
  image_id                    = "${data.aws_ami.ecs-optimized.id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name_root}"
  security_groups             = ["${aws_security_group.ecs.id}"]
  iam_instance_profile        = "${aws_iam_instance_profile.ecs.name}"
  user_data                   = "#!/bin/bash\necho '${data.template_file.ecs_config.rendered}' > /etc/ecs/ecs.config"
  associate_public_ip_address = true

  lifecycle {
    ignore_changes = ["image_id"]
  }
}

resource "aws_autoscaling_group" "ecs_cluster" {
  name                 = "${var.environment}_ecs_asg"
  vpc_zone_identifier  = ["${var.subnet_ids}"]
  launch_configuration = "${aws_launch_configuration.ecs_cluster.name}"
  min_size             = "${var.min_size}"
  max_size             = "${var.max_size}"
  desired_capacity     = "${var.desired_size}"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.environment}_ecs"
}
