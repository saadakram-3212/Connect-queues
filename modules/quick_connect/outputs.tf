output "quick_connect_ids" {
  description = "Map of quick connect names to their IDs"
  value = {
    for k, qc in aws_connect_quick_connect.this : k => qc.quick_connect_id
  }
}