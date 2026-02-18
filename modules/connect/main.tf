

## Hours of Operation
resource "aws_connect_hours_of_operation" "this" {
  for_each = var.hours_of_operations

  # required
  dynamic "config" {
    for_each = each.value.config

    content {
      day = config.value.day

      end_time {
        hours   = config.value.end_time.hours
        minutes = config.value.end_time.minutes
      }

      start_time {
        hours   = config.value.start_time.hours
        minutes = config.value.start_time.minutes
      }
    }
  }

  instance_id = var.instance_id
  name        = each.key
  time_zone   = each.value.time_zone

  # optional
  description = try(each.value.description, null)

  # tags
  tags = merge(
    { Name = each.key },
    var.hours_of_operations_tags,
    try(each.value.tags, {})
  )
}

## Queues
resource "aws_connect_queue" "this" {
  for_each = var.queues

  # required
  hours_of_operation_id = aws_connect_hours_of_operation.this[each.value.hours_of_operation_name].hours_of_operation_id
  instance_id           = var.instance_id
  name                  = each.key

  # optional
  description  = try(each.value.description, null)
  max_contacts = try(each.value.max_contacts, null)

  dynamic "outbound_caller_config" {
    for_each = contains(keys(each.value), "outbound_caller_config") ? [1] : []

    content {
      outbound_caller_id_name      = try(each.value.outbound_caller_config.outbound_caller_id_name, null)
      outbound_caller_id_number_id = try(each.value.outbound_caller_config.outbound_caller_id_number_id, null)
      outbound_flow_id             = try(each.value.outbound_caller_config.outbound_flow_id, null)
    }
  }

  quick_connect_ids = try(each.value.quick_connect_ids, null)
  status            = try(each.value.status, null)

  # tags
  tags = merge(
    { Name = each.key },
    var.queue_tags,
    try(each.value.tags, {})
  )
  depends_on = [ aws_connect_hours_of_operation.this ]
}

