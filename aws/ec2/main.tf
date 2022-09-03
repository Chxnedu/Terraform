provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "chxn-terraform-state"
    key = "ec2/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}
resource "aws_instance" "ubuntu_instance" {
  ami = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"
  key_name = aws_key_pair.id_rsa.id
  vpc_security_group_ids = [ aws_security_group.ssh-access.id ]
  timeouts {
    create = "10m"
    delete = "10m"
  }

}
resource "aws_key_pair" "id_rsa" {
  public_key = file("/home/kali/.ssh/id_rsa.pub")
}
resource "aws_security_group" "ssh-access" {
  name = "ssh-access"
  description = "allow ssh access"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "publicip" {
  value = aws_instance.ubuntu_instance.public_ip
}
