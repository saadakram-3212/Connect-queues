## Queues
output "queue_ids" {
  description = "Map of queue names to their IDs"
  value       = local.all_queue_ids
}

output "queue_arns" {
  description = "Map of queue names to their ARNs"
  value = merge([
    for k, m in module.connect_queues : m.queue_arns
  ]...)
}

output "queues" {
  description = "Map of queue names to their full details"
  value = merge([
    for k, m in module.connect_queues : m.queues
  ]...)
}

## Hours of Operation
output "hours_of_operation_ids" {
  description = "Map of hours of operation names to their IDs"
  value = merge([
    for k, m in module.connect_queues : m.hours_of_operation_ids
  ]...)
}

output "hours_of_operation_arns" {
  description = "Map of hours of operation names to their ARNs"
  value = merge([
    for k, m in module.connect_queues : m.hours_of_operation_arns
  ]...)
}

## Routing Profiles
output "routing_profile_ids" {
  description = "Map of routing profile names to their IDs"
  value       = local.all_routing_profile_ids
}



## Security Profiles
output "security_profile_ids" {
  description = "Map of security profile names to their IDs"
  value       = local.all_security_profile_ids
}



## Users
output "user_ids" {
  description = "Map of user names to their IDs"
  value       = local.all_user_ids
}

## Quick Connects
output "quick_connect_ids" {
  description = "Map of quick connect names to their IDs"
  value       = local.all_quick_connect_ids
}


## Phone Numbers
output "phone_number_ids" {
  description = "Map of phone number names to their IDs"
  value       = local.all_phone_number_ids
}

output "phone_number_values" {
  description = "Map of phone number names to their actual phone numbers"
  value       = local.all_phone_number_values
}


## Contact Flows
output "contact_flow_ids" {
  description = "Map of contact flow names to their IDs"
  value       = local.all_contact_flow_ids
}

output "contact_flow_arns" {
  description = "Map of contact flow names to their ARNs"
  value       = local.all_contact_flow_arns
}

## Contact Flow Modules
output "contact_flow_module_ids" {
  description = "Map of contact flow module names to their IDs"
  value       = local.all_contact_flow_module_ids
}

output "contact_flow_module_arns" {
  description = "Map of contact flow module names to their ARNs"
  value       = local.all_contact_flow_module_arns
}