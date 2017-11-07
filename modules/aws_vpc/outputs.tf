output "vpc_id" {
  value = "${aws_vpc.internal.id}"
}

output "vpc_route_table_id" {
  value = "${aws_vpc.internal.main_route_table_id}"
}

output "subnet_ids" {
  value = ["${aws_subnet.internal_subnet.*.id}"]
}
