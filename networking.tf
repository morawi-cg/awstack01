
#Public routing
resource "aws_internet_gateway" "awstack01_gw" {
  vpc_id = "${aws_vpc.awstack01_vpc.id}" 

  tags {
    Name = "awstack01_gw"
  }
}


resource "aws_route_table" "awstack_routing_table_public" {
  vpc_id = "${aws_vpc.awstack01_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.awstack01_gw.id}"
  }

  #route {
  #  cidr_block = "${var.vpc_cidr}"
  #  gateway_id = "${aws_internet_gateway.awstack01_gw.id}"
  #} 
  
tags {
    Name = "awstask01_routing_table"
  }
}

### Private routing chose instance to connect to out as its cheaper than gateway

resource "aws_route_table" "awstack_routing_table_private" {
  vpc_id = "${aws_vpc.awstack01_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.awstack01_nat_instance_gw.id}"
  } 

  #route {
  #  cidr_block = "${var.vpc_cidr}"
  #  gateway_id = "${aws_internet_gateway.awstack01_gw.id}"
  #}

tags {
    Name = "awstask01_routing_table_private"
  }
}


### This is the nat instance chosen as its cheaper than the nat gateway: This is for Jenkins to connect out for update


# awstack01_nat_instance_gw

resource "aws_instance" "awstack01_nat_instance_gw" {
  ami           = "ami-e1768386"
  subnet_id     = "${aws_subnet.awstack01_public_sub.id}"
  instance_type = "t2.micro"
  source_dest_check = false
  tags {
    Name = "awstack01_nat_instance_gw"
  }
}

### Assocciation of routes to subnets

# for Jenkins and for Artifactory

resource "aws_route_table_association" "awstack01_route_table_association_Jenkins" {
  subnet_id      = "${aws_subnet.awstack01_private_sub.id}"
  route_table_id = "${aws_route_table.awstack_routing_table_private.id}"
}

resource "aws_route_table_association" "awstack01_route_table_association_Nginx" {
  subnet_id      = "${aws_subnet.awstack01_public_sub.id}"
  route_table_id = "${aws_route_table.awstack_routing_table_public.id}"
} 
