resource "aws_lb" "awstack_alb" { # needed to remove 01 from name as syntax issues
  name               = "${var.alb_name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.awstack01_alb_sg.id}"]
  subnets            = ["${aws_subnet.awstack01_public_sub.id}"]

  enable_deletion_protection = false # can put true for production cases this is NOT so
  
  tags {
    Environment = "Development"
  }
}
