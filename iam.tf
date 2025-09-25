# IAM user for your tutor
resource "aws_iam_user" "developer" {
  name = "innocentchuks"
  tags = {
    tag-key = "tag-value"
  }
}

# Access key for CLI/API
resource "aws_iam_access_key" "developer" {
  user = aws_iam_user.developer.name
}

# Attach ReadOnlyAccess managed policy
resource "aws_iam_user_policy_attachment" "developer_readonly" {
  user       = aws_iam_user.developer.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_user_login_profile" "developer" {
  user                    = aws_iam_user.developer.name
}

