variable "contact_flows" {
  type        = any
  default     = {}
  description = <<-EOF
A map of Amazon Connect Contact Flows.

The key of the map is the Contact Flow `name`. The value is the configuration for that Contact Flow, supporting all arguments [documented here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/connect_contact_flow) (except `name` which is the key, and `instance_id` which is created or passed in).

Example/available options:
```
{
  <contact_flow_name> = {
    content      = optional(string) # one required
    content_hash = optional(string) # one required
    description  = optional(string)
    filename     = optional(string) # one required
    tags         = optional(map(string))
    type         = optional(string)
  }
}
```
  EOF
}

variable "contact_flow_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to all Contact Flow resources."
}

variable "instance_id" {
    type        = string
    default     = null
 }