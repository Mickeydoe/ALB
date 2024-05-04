resource "aws_lb" "mike_alb" {
  name = "my-app-load-balancer"
  ip_address_type = var.instance_type
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.gen-sg.id]
  subnets = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  
  tags = {
    Name = "my-application-load-balancer"
    }
}





resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.mike_alb.arn
  port              = "80"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}