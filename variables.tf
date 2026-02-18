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