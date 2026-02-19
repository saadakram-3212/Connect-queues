variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "connect_queues" {
  description = "A consolidated configuration object for Amazon Connect queue-related resources."
  type = list(object({
    instance_id              = optional(string, null)
    hours_of_operations_tags = optional(map(string), {})
    queue_tags               = optional(map(string), {})
    hours_of_operations      = optional(any, {})
    queues                   = optional(any, {})
  }))
  default = []
}


variable "routing_profiles" {
  description = "List of routing profile configurations."
  type = list(object({
    name                      = string
    instance_id               = string
    routing_profile_tags      = optional(map(string), {})
    default_outbound_queue_name = string
    description               = string
    media_concurrencies = list(object({
      channel     = string
      concurrency = number
    }))
    queue_configs = optional(list(object({
      channel  = string
      delay    = number
      priority = number
      queue_name = string
    })), [])
    tags = optional(map(string), {})
  }))
  default = []
}