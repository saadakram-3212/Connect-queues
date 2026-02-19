resource "aws_connect_routing_profile" "this" {
  for_each = var.routing_profiles

  # required
  default_outbound_queue_id = each.value.default_outbound_queue_id
  description               = each.value.description
  instance_id               = var.instance_id

  dynamic "media_concurrencies" {
    for_each = each.value.media_concurrencies

    content {
      channel     = media_concurrencies.value.channel
      concurrency = media_concurrencies.value.concurrency
    }
  }

  name = each.key

  # optional
  dynamic "queue_configs" {
    for_each = contains(keys(each.value), "queue_configs") ? each.value.queue_configs : []

    content {
      channel  = queue_configs.value.channel
      delay    = queue_configs.value.delay
      priority = queue_configs.value.priority
      queue_id = queue_configs.value.queue_id
    }
  }

  # tags
  tags = merge(
    var.routing_profile_tags,
  )
}
