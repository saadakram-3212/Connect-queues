resource "aws_connect_user" "this" {
  for_each = var.users

  # required
  instance_id = var.instance_id
  name        = each.key

  phone_config {
    phone_type = each.value.phone_config.phone_type

    # optional
    after_contact_work_time_limit = try(each.value.phone_config.after_contact_work_time_limit, null)
    auto_accept                   = try(each.value.phone_config.auto_accept, null)
    desk_phone_number             = try(each.value.phone_config.desk_phone_number, null)
  }

  routing_profile_id   = each.value.routing_profile_id
  security_profile_ids = each.value.security_profile_ids

  # optional
  directory_user_id  = try(each.value.directory_user_id, null)
  hierarchy_group_id = try(each.value.hierarchy_group_id, null)

  dynamic "identity_info" {
    for_each = contains(keys(each.value), "identity_info") ? [1] : []

    content {
      email      = try(each.value.identity_info.email, null)
      first_name = try(each.value.identity_info.first_name, null)
      last_name  = try(each.value.identity_info.last_name, null)
    }
  }

  password = try(each.value.password, null)

  # tags
  tags = merge(
    { Name = each.key },
    var.user_tags,
    try(each.value.tags, {})
  )
}