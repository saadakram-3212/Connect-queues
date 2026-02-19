resource "aws_connect_security_profile" "this" {
  for_each = var.security_profiles

  # required
  instance_id = var.instance_id
  name        = each.key

  # optional
  description = try(each.value.description, null)
  permissions = try(each.value.permissions, null)

  # tags
  tags = merge(
    var.security_profile_tags,
  )
}