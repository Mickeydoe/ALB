resource "aws_lb_target_group" "tg1" {
  name     = "tg1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_target_group" "tg2" {
  name     = "tg2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_instance" "instance1" {
  ami           = "ami-07caf09b362be10b8"  # Use the latest Amazon Linux 2 AMI
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.subnet1.id
  security_groups = [aws_security_group.allow_web.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Welcome to Instance 1!" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Instance1"
  }
}

resource "aws_instance" "instance2" {
  ami           = "ami-07caf09b362be10b8"  # Use the latest Amazon Linux 2 AMI
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.subnet2.id
  security_groups = [aws_security_group.allow_web.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Welcome to Instance 2!" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Instance2"
  }
}

resource "aws_instance" "instance3" {
  ami           = "ami-07caf09b362be10b8"  # Use the latest Amazon Linux 2 AMI
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.subnet2.id
  security_groups = [aws_security_group.allow_web.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Welcome to Instance 3!" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Instance3"
  }
}

resource "aws_instance" "instance4" {
  ami           = "ami-07caf09b362be10b8"  # Use the latest Amazon Linux 2 AMI
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.subnet2.id
  security_groups = [aws_security_group.allow_web.name]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Welcome to Instance !" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Instance4"
  }
}

resource "aws_lb_target_group_attachment" "tga1" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id        = aws_instance.instance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tga2" {
  target_group_arn = aws_lb_target_group.tg2.arn
  target_id        = aws_instance.instance2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tga3" {
  target_group_arn = aws_lb_target_group.tg1.arn
  target_id        = aws_instance.instance3.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tga4" {
  target_group_arn = aws_lb_target_group.tg2.arn
  target_id        = aws_instance.instance4.id
  port             = 80
}
