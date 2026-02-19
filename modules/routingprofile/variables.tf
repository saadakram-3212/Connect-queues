variable "routing_profiles" {
  type        = any
  default     = {}
  description = <<-EOF
A map of Amazon Connect Routing Profile.

The key of the map is the Routing Profile `name`. The value is the configuration for that Routing Profile, supporting all arguments [documented here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/connect_routing_profile) (except `name` which is the key, and `instance_id` which is created or passed in).

Example/available options:
```
{
  <routing_profile_name> = {
    default_outbound_queue_id = string
    description               = string
    media_concurrencies = [
      {
        channel     = string
        concurrency = number
      }
    ]
    queue_configs = optional([
      {
        channel  = string
        delay    = number
        priority = number
        queue_id = string
      }
    ])
    tags = optional(map(string))
  }
}
```
  EOF
}

variable "routing_profile_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to all Routing Profile resources."
}

variable "instance_id" {
  type        = string
  default     = null
  description = "If create_instance is set to false, you may still create other resources and pass in an instance ID that was created outside this module. Ignored if create_instance is true."
}
