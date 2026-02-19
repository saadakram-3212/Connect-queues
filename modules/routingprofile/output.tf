output "routing_profile_ids" {
  description = "Map of routing profile names to their IDs"
  value = {
    for k, rp in aws_connect_routing_profile.this : k => rp.routing_profile_id
  }
}

output "routing_profile_names" {
  description = "Map of routing profile names to their names"
  value = {
    for k, rp in aws_connect_routing_profile.this : k => rp.name
  }
}