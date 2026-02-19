output "security_profile_ids" {
  description = "Map of security profile names to their IDs"
  value = {
    for k, sp in aws_connect_security_profile.this : k => sp.security_profile_id
  }
}