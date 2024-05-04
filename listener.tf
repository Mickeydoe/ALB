resource "aws_lb_listener" "my-alb-listener-1" {
  load_balancer_arn = aws_lb.mike_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}

resource "aws_lb_listener_rule" "listener_rule1" {
  listener_arn = aws_lb_listener.my-alb-listener-1.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }

  condition {
    path_pattern {
      values = ["/cart", "/images"]
    }
  }
}

resource "aws_lb_listener_rule" "listener_rule2" {
  listener_arn = aws_lb_listener.my-alb-listener-1.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg2.arn
  }

  condition {
    path_pattern {
      values = ["/register", "/van"]
    }
  }
}
