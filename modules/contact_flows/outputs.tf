output "contact_flow_ids" {
  description = "Map of contact flow names to their IDs"
  value = {
    for k, v in aws_connect_contact_flow.this : k => v.contact_flow_id
  }
}

output "contact_flow_arns" {
  description = "Map of contact flow names to their ARNs"
  value = {
    for k, v in aws_connect_contact_flow.this : k => v.arn
  }
}

output "contact_flows" {
  description = "Map of contact flow names to their full details"
  value = {
    for k, v in aws_connect_contact_flow.this : k => {
      id          = v.contact_flow_id
      arn         = v.arn
      name        = v.name
      description = v.description
      type        = v.type
      tags        = v.tags_all
    }
  }
}