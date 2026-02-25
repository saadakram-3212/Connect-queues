resource "awscc_connect_prompt" "example" {
  instance_arn = var.instance_arn
  name         = var.prompt_name
  description  = var.prompt_description
  s3_uri       = "s3://${var.s3_bucket}/${var.s3_key}"

  tags = [for k, v in var.prompt_tags : {
    key   = k
    value = v
  }]
}