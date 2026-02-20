resource "aws_connect_phone_number" "this" {
  for_each = { for idx, pn in var.phone_numbers : idx => pn }

  target_arn   = var.instance_id
  country_code = each.value.country_code
  type         = each.value.type
  description  = try(each.value.description, null)
  prefix       = try(each.value.prefix, null)
  region       = try(each.value.region, null)

  tags = merge(
    var.phone_number_tags,
  )
}