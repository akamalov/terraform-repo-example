resource "aws_iam_instance_profile" "ecs" {
  name = "ecs_instance_profile_${var.environment}"
  path = "/"
  role = "${aws_iam_role.ecs_instance_role.name}"

  lifecycle {
    ignore_changes = ["name"]
  }
}

resource "aws_iam_role" "ecs_instance_role" {
  name = "ecs_instance_role_${var.environment}"

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Effect": "Allow"
    }
  ]
}
EOF

  lifecycle {
    ignore_changes = ["name"]
  }
}

resource "aws_iam_role_policy" "ecs_instance_role" {
  name = "ecs_instance_role_policy_${var.environment}"
  role = "${aws_iam_role.ecs_instance_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecs:DeregisterContainerInstance",
        "ecs:DiscoverPollEndpoint",
        "ecs:Poll",
        "ecs:RegisterContainerInstance",
        "ecs:StartTelemetrySession",
        "ecs:Submit*",
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecs:StartTask"
      ],
      "Resource": "*"
    }
  ]
}
EOF

  lifecycle {
    ignore_changes = ["name"]
  }
}

resource "aws_iam_role" "ecs_service_role" {
  name = "ecs_service_role_${var.environment}"

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["ecs.amazonaws.com"]
      },
      "Effect": "Allow"
    }
  ]
}
EOF

  lifecycle {
    ignore_changes = ["name"]
  }
}

# Allows the services running on ECS to manage the load balancer
resource "aws_iam_role_policy" "ecs_service_role_policy" {
  name = "ecs_service_role_policy_${var.environment}"
  role = "${aws_iam_role.ecs_service_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "elasticloadbalancing:Describe*",
        "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
        "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
        "elasticloadbalancing:RegisterTargets",
        "elasticloadbalancing:DeregisterTargets",
        "ec2:Describe*"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF

  lifecycle {
    ignore_changes = ["name"]
  }
}
