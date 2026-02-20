output "phone_number_ids" {
  description = "The IDs of the created phone numbers"
  value       = { for k, v in aws_connect_phone_number.this : k => v.id }
}
