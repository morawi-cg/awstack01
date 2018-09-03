resource "aws_alb" "awstack_alb" { # needed to remove 01 from name as syntax issues
  name               = "${var.alb_name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.awstack01_alb_sg.id}"]
  subnets            = ["${aws_subnet.awstack01_public_sub.id}","${aws_subnet.awstack01_public_sub2.id}"] # for the alb purpose

  enable_deletion_protection = false # can put true for production cases this is NOT so
  
  tags {
    Environment = "Development"
  }
}
resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = "${aws_alb.awstack_alb.arn}"  
  port              = "80"  
  protocol          = "HTTP"
  
  default_action {    
    target_group_arn = "${aws_alb_target_group.alb_target.arn}"
    type             = "forward"  
  }
}

resource "aws_alb_target_group" "alb_target" {  
  name     = "alb-target-group" # name must never thave underscores many errors on this 
  port     = "80"  
  protocol = "HTTP"  
  vpc_id   = "${aws_vpc.awstack01_vpc.id}"   
  tags {    
    name = "aws-alb-target-group"    
  }   
  stickiness {    
    type            = "lb_cookie"    
    cookie_duration = 1800    
    enabled         = true  
  }   
  health_check {    
    healthy_threshold   = 3    
    unhealthy_threshold = 10    
    timeout             = 5    
    interval            = 10    
    path                = "/"    
    port                = 80  
  }
}

#Instance Attachment
resource "aws_alb_target_group_attachment" "svc_physical_external" {
  target_group_arn = "${aws_alb_target_group.alb_target.arn}"
  target_id        = "${aws_instance.Nginx.id}"  
  port             = 80
}
