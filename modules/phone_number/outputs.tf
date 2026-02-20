output "phone_number_ids" {
  description = "The IDs of the created phone numbers"
  value       = { for k, v in aws_connect_phone_number.this : k => v.id }
}


# modules/phonenumbers/outputs.tf
output "phone_number_ids" {
  description = "List of claimed phone number IDs"
  value = [
    for v in aws_connect_phone_number.this : v.id
  ]
}

output "phone_numbers" {
  description = "List of claimed phone numbers with full details"
  value = [
    for v in aws_connect_phone_number.this : {
      id           = v.id
      phone_number = v.phone_number
      country_code = v.country_code
      type         = v.type
      description  = v.description
      region       = v.region
      arn          = v.arn
      tags         = v.tags_all
    }
  ]
}