# Output the access key (sensitive)
output "innocentchuks_access_key_id" {
  value     = aws_iam_access_key.developer.id
  sensitive = true
}

output "innocentchuks_secret_access_key" {
  value     = aws_iam_access_key.developer.secret
  sensitive = true
}
