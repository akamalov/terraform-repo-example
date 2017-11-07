output "ecs_cluster_id" {
  value = "${module.ecs_cluster.ecs_cluster_id}"
}

output "ecs_service_role_arn" {
  value = "${module.ecs_cluster.ecs_service_role_arn}"
}

output "security_group_id" {
  value = "${module.ecs_cluster.security_group_id}"
}
