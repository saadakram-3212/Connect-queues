# root main.tf

locals {
  connect_queues = { for idx, q in var.connect_queues : idx => q }
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