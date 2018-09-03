aws_region          = "eu-west-2"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
public_subnet_cidr_alb = "10.0.3.0/24" # for the need of the ALB only
private_subnet_cidr = "10.0.2.0/24"
alb_name            = "awstack-alb" # removed 01 due to syntax problem
