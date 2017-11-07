output "vpc_id" {
  value = "${module.aws_vpc.vpc_id}"
}

output "vpc_route_table_id" {
  value = "${module.aws_vpc.vpc_route_table_id}"
}

output "subnet_ids" {
  value = "${module.aws_vpc.subnet_ids}"
}

output "key_name_root" {
  value = "${aws_key_pair.root.key_name}"
}
