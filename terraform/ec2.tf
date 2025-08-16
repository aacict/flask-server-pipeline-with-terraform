# We can choose our emi based on our choice
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

# key pair can be generated from the aws cloud console
data "aws_key_pair" "key_pair" {
  key_name = "ec2-flask-server-keypair"
}

# Main Ec2 instance where app will be hosted
resource "aws_instance" "flask_server" {
  ami                    = data.aws_ami.ubuntu.id                  # Used from data ami
  instance_type          = "t2.medium"                                
  vpc_security_group_ids = [aws_security_group.flask_server_sg.id]     # Used from security.tf 
  key_name               = data.aws_key_pair.key_pair.key_name  # Used from data keypair 

  user_data = <<-EOF
            #!/bin/bash
            sudo apt-get update
            sudo apt install docker.io -y
            echo "${var.ghcr_pat}" | sudo docker login ghcr.io -u aacict --password-stdin
            sudo docker pull ghcr.io/aacict/flask-server:latest
            sudo docker run -d -p 3000:5000 ghcr.io/aacict/flask-server:latest
            EOF
  tags = {
    Name = "flask_server"
  }
}
