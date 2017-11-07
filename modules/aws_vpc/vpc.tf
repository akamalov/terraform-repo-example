# Create a VPC, which is the base network the entire environment will be
# placed inside.
# https://www.terraform.io/docs/providers/aws/r/vpc.html
resource "aws_vpc" "internal" {
  cidr_block           = "${var.vpc_cidr_block_prefix}.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name        = "${var.environment}_internal"
    environment = "${var.environment}"
  }
}

# Create a subnet for each AZ
# https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "internal_subnet" {
  # Ideally we would create a subnet for each availability zone, but
  # Terraform can't currently take the output of a resource as an input to
  # the count property so we just hardcode 3 for now.
  count = "3"

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "${var.vpc_cidr_block_prefix}.${count.index + 1}.0/24"
  vpc_id            = "${aws_vpc.internal.id}"

  tags {
    Name        = "${var.environment}_internal_subnet_${count.index + 1}"
    environment = "${var.environment}"
  }
}

# Create an internet gateway so that instances in this VPC can have internet access
# https://www.terraform.io/docs/providers/aws/r/internet_gateway.html
resource "aws_internet_gateway" "internal" {
  vpc_id = "${aws_vpc.internal.id}"

  tags {
    Name        = "${var.environment}_internal"
    environment = "${var.environment}"
  }
}

# Create a default route so that all unknown traffic is routed to the internet
# https://www.terraform.io/docs/providers/aws/r/route.html
resource "aws_route" "internal_main" {
  route_table_id         = "${aws_vpc.internal.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internal.id}"
}
