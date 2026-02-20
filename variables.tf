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
  }))
  default = []
}


variable "security_profiles" {
  description = "List of security profile configurations."
  type = list(object({
    name                  = string
    instance_id           = string
    security_profile_tags = optional(map(string), {})
    description           = optional(string, null)
    permissions           = optional(list(string), [])
  }))
  default = []
}


variable "users" {
  description = "List of Amazon Connect user configurations."
  type = list(object({
    name                = string
    instance_id         = string
    user_tags           = optional(map(string), {})
    directory_user_id   = optional(string, null)
    hierarchy_group_id  = optional(string, null)
    identity_info = optional(object({
      email      = optional(string, null)
      first_name = optional(string, null)
      last_name  = optional(string, null)
    }), null)
    password = optional(string, null)
    phone_config = object({
      phone_type                    = string
      after_contact_work_time_limit = optional(number, 0)
      auto_accept                   = optional(bool, false)
      desk_phone_number             = optional(string, null)
    })
    routing_profile_name  = string
    security_profile_names = list(string)
  }))
  default = []
}

variable "quick_connects" {
  description = "List of Amazon Connect Quick Connect configurations."
  type = list(object({
    name               = string
    instance_id        = string
    quick_connect_tags = optional(map(string), {})
    description        = optional(string, null)
    quick_connect_config = object({
      quick_connect_type = string
      phone_config = optional(object({
        phone_number = string
      }), null)
      queue_config = optional(object({
        contact_flow_id = string
        queue_name      = string
      }), null)
      user_config = optional(object({
        contact_flow_id = string
        user_name       = string
      }), null)
    })
    tags = optional(map(string), {})
  }))
  default = []
}


variable "phone_numbers" {
  description = "List of Amazon Connect phone number configurations."
  type = list(object({
    instance_id       = string
    phone_number_tags = optional(map(string), {})
    country_code      = optional(string, null)
    type              = optional(string, null)
    description       = optional(string, null)
    prefix            = optional(string, null)
    region            = optional(string, null)
    tags              = optional(map(string), {})
  }))
  default = []
}