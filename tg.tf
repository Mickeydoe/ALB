# create target group
resource "aws_lb_target_group" "tg" {
    for_each = {
      "Mike" = "/mike*",
      "Vanessa" = "/vanessa*"
      "Andy"  = "/andy*" 
      "Miriam" = "/miriam*"
    }
  name        = "tg-${each.key}"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/"
    protocol            = HTTP 
    timeout             = 2
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  tags = {
    Name = "tg-${each.key}"
  }
}

