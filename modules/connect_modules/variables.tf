variable "contact_flow_modules" {
  type        = any
  default     = {}
  description = <<-EOF
A map of Amazon Connect Contact Flow Modules.

The key of the map is the Contact Flow Module `name`. The value is the configuration for that Contact Flow, supporting all arguments [documented here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/connect_contact_flow_module) (except `name` which is the key, and `instance_id` which is created or passed in).

Example/available options:
```
{
  <contact_flow_module_name> = {
    content      = optional(string) # one required
    content_hash = optional(string) # one required
    description  = optional(string)
    filename     = optional(string) # one required
    tags         = optional(map(string))
  }
}
```
  EOF
}

variable "contact_flow_module_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to all Contact Flow Module resources."
}

variable "instance_id" {
  type    = string
  default = null
}