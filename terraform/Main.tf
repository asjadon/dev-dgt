provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0317b0f0a0144b137" # Amazon Linux
  instance_type = "t2.micro"
  key_name      = "my-keypair"

  security_groups = ["default"]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              systemctl start docker
              docker run -d -p 80:80 yourdockerhubusername/dev-dgt:latest
              EOF

  tags = {
    Name = "DevOps-Project"
  }
}
