resource "aws_instance" "Jenkins" {
  ami           = "ami-e1768386"  
  subnet_id     = "${aws_subnet.awstack01_private_sub.id}" 
  instance_type = "t2.micro"
  key_name = "awstack01-key"
  security_groups = ["${aws_security_group.awstack01_nginx_sg.id}"] # must have it for all instances
  user_data = "${data.template_file.init.rendered}"
  tags {
    Name = "Jenkins"
  }
}

# Template for initial configuration bash script
data "template_file" "init" {
  template = "${file("init.tpl")}"

}


