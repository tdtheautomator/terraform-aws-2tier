#Creating Load Balancer
resource "aws_lb" "external-elb" {
  name               = "external-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb-sg.id]
  subnets            = [aws_subnet.subnet01.id, aws_subnet.subnet02.id]
}

resource "aws_lb_target_group" "external-elb-tg" {
  name     = "external-elb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc-west.id
}

resource "aws_lb_target_group_attachment" "external-elb-tg-websrv1" {
  target_group_arn = aws_lb_target_group.external-elb-tg.arn
  target_id        = aws_instance.websrv1.id
  port             = 80
  depends_on = [
    aws_instance.websrv1,
  ]
}

resource "aws_lb_target_group_attachment" "external-elb-tg-websrv2" {
  target_group_arn = aws_lb_target_group.external-elb-tg.arn
  target_id        = aws_instance.websrv2.id
  port             = 80
  depends_on = [
    aws_instance.websrv2,
  ]
}

resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb-tg.arn
  }
}