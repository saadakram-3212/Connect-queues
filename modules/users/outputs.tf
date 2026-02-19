output "user_ids" {
  description = "Map of user names to their IDs"
  value = {
    for k, u in aws_connect_user.this : k => u.user_id
  }
}

output "user_arns" {
  description = "Map of user names to their ARNs"
  value = {
    for k, u in aws_connect_user.this : k => u.arn
  }
}