# root main.tf

locals {
  connect_queues = { for idx, q in var.connect_queues : idx => q }

    all_queue_ids = merge([
    for k, m in module.connect_queues : m.queue_ids
  ]...)
}

module "connect_queues" {
  source   = "./modules/connect"
  for_each = local.connect_queues

  instance_id              = each.value.instance_id
  hours_of_operations      = each.value.hours_of_operations
  hours_of_operations_tags = each.value.hours_of_operations_tags
  queues                   = each.value.queues
  queue_tags               = each.value.queue_tags
}



module "connect_routing_profile" {
  for_each = { for rp in var.routing_profiles : rp.name => rp }
  source   = "./modules/routingprofile"

  instance_id          = each.value.instance_id
  routing_profile_tags = each.value.routing_profile_tags

  routing_profiles = {
    (each.value.name) = {
      default_outbound_queue_id = local.all_queue_ids[each.value.default_outbound_queue_name]
      description               = each.value.description
      media_concurrencies       = each.value.media_concurrencies
      tags                      = each.value.tags
      queue_configs = [
        for qc in each.value.queue_configs : {
          channel  = qc.channel
          delay    = qc.delay
          priority = qc.priority
          queue_id = local.all_queue_ids[qc.queue_name]
        }
      ]
    }
  }
}