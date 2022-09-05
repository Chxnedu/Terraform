variable "region" {
  default = "us-east-1"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "ami" {
  type = map
  default = {
    "ProjectA" = "ami-08d4ac5b634553e16"
    "ProjectB" = "ami-0729e439b6769d6ab"
  }
}
