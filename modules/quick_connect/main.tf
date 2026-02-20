resource "aws_connect_quick_connect" "this" {
  for_each = var.quick_connects

  # required
  instance_id = var.instance_id
  name        = each.key

  quick_connect_config {
    quick_connect_type = each.value.quick_connect_config.quick_connect_type

    # optional - use try() to safely check if phone_config exists and is not null
    dynamic "phone_config" {
      for_each = try(each.value.quick_connect_config.phone_config, null) != null ? [1] : []
      content {
        phone_number = each.value.quick_connect_config.phone_config.phone_number
      }
    }

    # optional - use try() to safely check if queue_config exists and is not null
    dynamic "queue_config" {
      for_each = try(each.value.quick_connect_config.queue_config, null) != null ? [1] : []
      content {
        contact_flow_id = each.value.quick_connect_config.queue_config.contact_flow_id
        queue_id        = each.value.quick_connect_config.queue_config.queue_id
      }
    }

    # optional - use try() to safely check if user_config exists and is not null
    dynamic "user_config" {
      for_each = try(each.value.quick_connect_config.user_config, null) != null ? [1] : []
      content {
        contact_flow_id = each.value.quick_connect_config.user_config.contact_flow_id
        user_id         = each.value.quick_connect_config.user_config.user_id
      }
    }
  }

  # optional
  description = try(each.value.description, null)

  # tags
  tags = merge(
    var.quick_connect_tags,
  )
}