# root main.tf

locals {
  # Flatten the list into a map keyed by a unique index or name for iteration
  connect_queues = { for idx, q in var.connect_queues : idx => q }
}

module "connect_queues" {
  source   = "./modules/connect"
  for_each = local.connect_queues

  create_instance          = each.value.create_instance
  instance_id              = each.value.instance_id
  hours_of_operations      = each.value.hours_of_operations
  hours_of_operations_tags = each.value.hours_of_operations_tags
  queues                   = each.value.queues
  queue_tags               = each.value.queue_tags
}