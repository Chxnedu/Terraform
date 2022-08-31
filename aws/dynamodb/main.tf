provider "aws" {
  region = "us-east-1"
}
resource "aws_dynamodb_table" "test_table" {
  name = "employee_data"
  hash_key = "employee_id"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "employee_id"
    type = "N"
  }
}
resource "aws_dynamodb_table_item" "example" {
  table_name = aws_dynamodb_table.test_table.name
  hash_key = aws_dynamodb_table.test_table.hash_key
  item = <<ITEM
{
  "employee_id": { "N": "1" },
  "age": { "N": "20" },
  "name": { "S": "chxnedu" },
  "role": { "S": "Devops" }
}
ITEM
}
