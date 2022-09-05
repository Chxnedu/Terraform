module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name = "ubuntu-instance"

  ami                    = "ami-08d4ac5b634553e16"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.id_rsa.id
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.ssh-access.id]

  tags = {
    Terraform   = "true"
  }
}
