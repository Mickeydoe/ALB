resource "aws_lb" "mike_alb" {
  name = "my-app-load-balancer"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.gen-sg.id]
  subnets = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  tags = {
    Name = "my-application-load-balancer"
    }
}
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    status_code      = "404"
    content_type     = "text/plain"
    message_body     = "Not Found"
  }
}

