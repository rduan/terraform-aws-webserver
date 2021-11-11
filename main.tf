#Create and bootstrap webserver
resource "aws_instance" "webserver" {
  ami                         = data.aws_ssm_parameter.webserver-ami.value
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  user_data =<<-EOF
      #!/bin/bash
      exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
      sudo yum -y install httpd
      echo '<h1><center>Hello World!</center></h1>' > /var/www/html/index.html
      sudo systemctl enable httpd
      sudo systemctl start httpd
      EOF
  tags = {
    Name = "webserver"
  }
}
