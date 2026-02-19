# root main.tf

locals {
  connect_queues = { for idx, q in var.connect_queues : idx => q }

    all_queue_ids = merge([
    for k, m in module.connect_queues : m.queue_ids
  ]...)

  all_routing_profile_ids = merge([
    for k, m in module.connect_routing_profile : m.routing_profile_ids
  ]...)

  all_security_profile_ids = merge([
    for k, m in module.connect_security_profile : m.security_profile_ids
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


module "connect_security_profile" {
  for_each = { for sp in var.security_profiles : sp.name => sp }
  source   = "./modules/securityprofiles"

  instance_id           = each.value.instance_id
  security_profile_tags = each.value.security_profile_tags

  security_profiles = {
    (each.value.name) = {
      description = each.value.description
      permissions = each.value.permissions
    }
  }
}


module "connect_users" {
  for_each = { for u in var.users : u.name => u }
  source   = "./modules/users"

  instance_id = each.value.instance_id
  user_tags   = each.value.user_tags

  users = {
    (each.value.name) = {
      directory_user_id  = each.value.directory_user_id
      hierarchy_group_id = each.value.hierarchy_group_id
      identity_info      = each.value.identity_info
      password           = each.value.password
      phone_config       = each.value.phone_config
      routing_profile_id = local.all_routing_profile_ids[each.value.routing_profile_name]
      security_profile_ids = [
        for sp_name in each.value.security_profile_names :
        local.all_security_profile_ids[sp_name]
      ]
    }
  }
}