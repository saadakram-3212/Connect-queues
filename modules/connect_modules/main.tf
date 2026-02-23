resource "aws_connect_contact_flow_module" "this" {
  for_each = var.contact_flow_modules

  # required
  instance_id = var.instance_id
  name        = each.key

  # content (one required)
  content      = try(each.value.content, null)
  content_hash = try(each.value.content_hash, null)
  filename     = try(each.value.filename, null)

  # optional
  description = try(each.value.description, null)

  # tags
  tags = merge(
    var.contact_flow_module_tags,
  )
}