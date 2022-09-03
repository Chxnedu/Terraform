provider "aws" {
  region = "us-east-1"
}
resource "aws_iam_user" "testuser" {
  name = "ugo"
  tags = {
    "Description" = "a user i'm creating for testing purposes"
  }
}
resource "aws_iam_policy" "adminpolicy" {
  name   = "test_admin_policy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}
resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.testuser.name
  policy_arn = aws_iam_policy.adminpolicy.arn
}
