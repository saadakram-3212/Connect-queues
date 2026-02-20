# output "phone_number_ids" {
#   description = "The IDs of the created phone numbers"
#   value       = { for k, v in aws_connect_phone_number.this : k => v.id }
# }


output "phone_number_ids" {
  value = {
    for k, v in aws_connect_phone_number.this : k => v.id
  }
}

output "phone_number_values" {
  value = {
    for k, v in aws_connect_phone_number.this : k => v.phone_number
  }
}

output "phone_numbers" {
  value = {
    for k, v in aws_connect_phone_number.this : k => {
      id           = v.id
      arn          = v.arn
      phone_number = v.phone_number
      country_code = v.country_code
      type         = v.type
      description  = v.description
      region       = v.region
      tags         = v.tags_all
    }
  }
}