resource "aws_vpc" "awstack01_vpc" {
     cidr_block = "${var.vpc_cidr}" 
}

resource "aws_subnet" "awstack01_public_sub" {
     vpc_id = "${aws_vpc.awstack01_vpc.id}"
     cidr_block = "${var.public_subnet_cidr}" 
     availability_zone = "eu-west-2a"
}

resource "aws_subnet" "awstack01_private_sub" {
       vpc_id = "${aws_vpc.awstack01_vpc.id}"
       cidr_block = "${var.private_subnet_cidr}"
       availability_zone = "eu-west-2b"
}
