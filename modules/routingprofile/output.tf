output "routing_profile_ids" {
  description = "Map of routing profile names to their IDs"
  value = {
    for k, rp in aws_connect_routing_profile.this : k => rp.routing_profile_id
  }
}