
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "ci_key" {
  key_name   = "ci-key"
  public_key = file("${path.module}/ci-key.pub")
}

resource "aws_instance" "server_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ci_key.key_name

  tags = {
    Name = var.server_name
  }
}

output "aws_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.server_ec2.public_ip
}
