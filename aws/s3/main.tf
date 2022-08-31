provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "testbucket" {
  bucket = "chxn-tf-test-bucket"

  tags = {
    Description = "my test terraform bucket"
  }
}
resource "aws_s3_object" "teststuff" {
  bucket = aws_s3_bucket.testbucket.id
  key = "Dockerfile"
  source = "/home/kali/Dockerfile"
}
resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.testbucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.testbucket.arn,
      "${aws_s3_bucket.testbucket.arn}/*",
    ]
  }
}
