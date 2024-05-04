resource "aws_lb" "mike_alb" {
  name = "my-app-load-balancer"
  ip_address_type = "ipv4"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.gen-sg.id]
  subnets = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  
  tags = {
    Name = "my-application-load-balancer"
    }
}


resource "aws_internet_gateway" "my_igw" {
  vpc_id = "vpc-01f63727dd73687d8"  # Specify your VPC ID
}

