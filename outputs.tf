output "all_phone_number_ids" {
  description = "Map of phone number keys to their IDs"
  value = {
    for k, m in module.connect_phone_numbers : k => m.phone_number_ids
  }
}