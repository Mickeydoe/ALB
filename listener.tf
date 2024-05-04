resource "aws_lb_listener_rule" "listener_rule1" {
  listener_arn = aws_lb_listener.front_end.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }

  condition {
    path_pattern {
      values = ["/path1*"]
    }
  }
}

resource "aws_lb_listener_rule" "listener_rule2" {
  listener_arn = aws_lb_listener.front_end.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg2.arn
  }

  condition {
    path_pattern {
      values = ["/path2*"]
    }
  }
}
