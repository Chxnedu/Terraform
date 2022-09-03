terraform {
  backend "s3" {
    bucket         = "chxn-terraform-state"
    key            = "dynamodb/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}
