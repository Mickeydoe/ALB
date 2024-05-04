resource "aws_subnet" "subnet1" {
  vpc_id = "vpc-01f63727dd73687d8"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Subnet1"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id            = "vpc-01f63727dd73687d8"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Subnet2"
  }
}
resource "aws_security_group" "gen-sg" {
    vpc_id = "vpc-01f63727dd73687d8"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

      tags = {
    Name = "AllowWebTraffic"
  }

  
}