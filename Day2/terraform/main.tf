provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "admin" {
  ami           = "ami-006f82a1d5a27da54"
  instance_type = "t3.micro"
  key_name      = "project"
  security_groups = [ "Project" ]
  root_block_device {
    volume_size = 20
    volume_type = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "MyEC2Instance"
  }
}

output "PublicIP" {
  value = aws_instance.admin.public_ip
}