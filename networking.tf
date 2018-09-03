resource "aws_internet_gateway" "awstack01_gw" {
  vpc_id = "${aws_vpc.awstack01_vpc.id}" 

  tags {
    Name = "awstack01_gw"
  }
}
