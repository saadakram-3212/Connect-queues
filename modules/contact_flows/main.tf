resource "aws_connect_contact_flow" "this" {
  for_each = var.contact_flows

  # required
  instance_id = var.instance_id
  name        = each.key

  # content (one required)
  content      = try(each.value.content, null)
  content_hash = try(each.value.content_hash, null)
  filename     = try(each.value.filename, null)

  # optional
  description = try(each.value.description, null)
  type        = try(each.value.type, null)

  # tags
  tags = merge(
    { Name = each.key },
    var.contact_flow_tags,
  )
}