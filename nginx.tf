resource "aws_instance" "Nginx" {
  ami           = "ami-e1768386"  
  subnet_id     = "${aws_subnet.awstack01_public_sub.id}" 
  instance_type = "t2.micro"
  user_data = "${data.template_file.init_nginx.rendered}"
  tags {
    Name = "Nginx"
  }
}

# Template for initial configuration bash script
data "template_file" "init_nginx" {
  template = "${file("init_nginx.tpl")}"

}


