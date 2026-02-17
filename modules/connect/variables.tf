variable "hours_of_operations" {
  type        = any
  default     = {}
  description = <<-EOF
A map of Amazon Connect Hours of Operations.

The key of the map is the Hours of Operation `name`. The value is the configuration for that Hours of Operation, supporting all arguments [documented here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/connect_hours_of_operation) (except `name` which is the key, and `instance_id` which is created or passed in).

Example/available options:
```
{
  <hours_of_operation_name> = {
    config = [
      {
        day = string
        end_time = {
          hours   = number
          minutes = number
        }
        start_time = {
          hours   = number
          minutes = number
        }
      }
    ]
    description = optional(string)
    tags        = optional(map(string))
    time_zone   = string
  }
}
```
  EOF
}

variable "hours_of_operations_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to all Hours of Operations resources."
}


variable "create_instance" {
  type        = bool
  default     = true
  description = "Controls if the aws_connect_instance resource should be created. Defaults to true."
}

variable "instance_id" {
  type        = string
  default     = null
  description = "If create_instance is set to false, you may still create other resources and pass in an instance ID that was created outside this module. Ignored if create_instance is true."
}


variable "queues" {
  type        = any
  default     = {}
  description = <<-EOF
A map of Amazon Connect Queues.

The key of the map is the Queue `name`. The value is the configuration for that Queue, supporting all arguments [documented here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/connect_queue) (except `name` which is the key, and `instance_id which` is created or passed in).

Example/available options:
```
{
  <queue_name> = {
    description            = optional(string)
    hours_of_operation_id  = string
    max_contacts           = optional(number)
    outbound_caller_config = optional({
      outbound_caller_id_name      = optional(string)
      outbound_caller_id_number_id = optional(string)
      outbound_flow_id             = optional(string)
    })
    quick_connect_ids = optional(list(string))
    status            = optional(string)
    tags              = optional(map(string))
  }
}
```
  EOF
}

variable "queue_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to all Queue resources."
}
