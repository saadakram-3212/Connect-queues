## Hours of Operation

output "hours_of_operation_ids" {
  description = "Map of hours of operation names to their IDs"
  value = {
    for k, h in aws_connect_hours_of_operation.this : k => h.hours_of_operation_id
  }
}

output "hours_of_operation_arns" {
  description = "Map of hours of operation names to their ARNs"
  value = {
    for k, h in aws_connect_hours_of_operation.this : k => h.arn
  }
}

output "hours_of_operation_configs" {
  description = "Map of hours of operation names to their configuration details"
  value = {
    for k, h in aws_connect_hours_of_operation.this : k => {
      id          = h.hours_of_operation_id
      arn         = h.arn
      name        = h.name
      time_zone   = h.time_zone
      description = h.description
      config      = h.config
    }
  }
}

## Queues

output "queue_ids" {
  description = "Map of queue names to their IDs"
  value = {
    for k, q in aws_connect_queue.this : k => q.queue_id
  }
}

output "queue_arns" {
  description = "Map of queue names to their ARNs"
  value = {
    for k, q in aws_connect_queue.this : k => q.arn
  }
}

output "queue_hours_of_operation_ids" {
  description = "Map of queue names to their hours of operation IDs"
  value = {
    for k, q in aws_connect_queue.this : k => q.hours_of_operation_id
  }
}

output "queues" {
  description = "Map of queue names to their complete details"
  value = {
    for k, q in aws_connect_queue.this : k => {
      id                    = q.queue_id
      arn                   = q.arn
      name                  = q.name
      description           = q.description
      hours_of_operation_id = q.hours_of_operation_id
      max_contacts          = q.max_contacts
      status                = q.status
      outbound_caller_config = try(q.outbound_caller_config[0], null)
      quick_connect_ids     = q.quick_connect_ids
      tags                  = q.tags_all
    }
  }
}

