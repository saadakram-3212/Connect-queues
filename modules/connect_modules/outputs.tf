output "contact_flow_module_ids" {
  description = "Map of contact flow module names to their IDs"
  value = {
    for k, v in aws_connect_contact_flow_module.this : k => v.contact_flow_module_id
  }
}

output "contact_flow_module_arns" {
  description = "Map of contact flow module names to their ARNs"
  value = {
    for k, v in aws_connect_contact_flow_module.this : k => v.arn
  }
}

output "contact_flow_modules" {
  description = "Map of contact flow module names to their full details"
  value = {
    for k, v in aws_connect_contact_flow_module.this : k => {
      id          = v.contact_flow_module_id
      arn         = v.arn
      name        = v.name
      description = v.description
      tags        = v.tags_all
    }
  }
}