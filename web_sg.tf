 resource "aws_security_group" "awstack01_nginx_sg" {
     name = "awstack01_nginx_sg"
     description = "Allow HTTP traffic"
     vpc_id = "${aws_vpc.awstack01_vpc.id}"
     ingress {
       from_port = 80
       to_port = 80
       protocol = "tcp"
       security_groups = ["${aws_security_group.awstack01_alb_sg.id}"]
} 
     egress {
       from_port = 0
       to_port = 0
       protocol = "-1"
       cidr_blocks = ["0.0.0.0/0"]
} } 


#Created its security group in the same file to keep up with max file count/type specified in the spec.

resource "aws_security_group" "awstack01_alb_sg" {
     name = "awstack01_alb_sg"
     description = "Allow HTTP traffic"
     vpc_id = "${aws_vpc.awstack01_vpc.id}"
     ingress {
       from_port = 80
       to_port = 80
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
}
     egress {
       from_port = 0
       to_port = 0
       protocol = "-1"
       cidr_blocks = ["0.0.0.0/0"]
} }


