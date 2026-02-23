resource "aws_connect_quick_connect" "this" {
  for_each = var.quick_connects

  # required
  instance_id = var.instance_id
  name        = each.key

  quick_connect_config {
    quick_connect_type = each.value.quick_connect_config.quick_connect_type

    dynamic "phone_config" {
      for_each = try(each.value.quick_connect_config.phone_config, null) != null ? [1] : []
      content {
        phone_number = each.value.quick_connect_config.phone_config.phone_number
      }
    }

    dynamic "queue_config" {
      for_each = try(each.value.quick_connect_config.queue_config, null) != null ? [1] : []
      content {
        contact_flow_id = each.value.quick_connect_config.queue_config.contact_flow_id
        queue_id        = each.value.quick_connect_config.queue_config.queue_id
      }
    }

    dynamic "user_config" {
      for_each = try(each.value.quick_connect_config.user_config, null) != null ? [1] : []
      content {
        contact_flow_id = each.value.quick_connect_config.user_config.contact_flow_id
        user_id         = each.value.quick_connect_config.user_config.user_id
      }
    }
  }

  description = try(each.value.description, null)

  tags = merge(
    var.quick_connect_tags,
  )
}