variable "instance_id" {
  description = "The Amazon Connect instance ID where the phone number will be claimed"
  type        = string
}

variable "phone_number_tags" {
  description = "A map of tags to assign to the phone number"
  type        = map(string)
  default     = {}
}

variable "phone_numbers" {
  description = "A list of phone numbers to claim, with their configuration. The `number` field is required, other fields are optional. If `number` is not provided, a new phone number will be provisioned based on the provided `country_code` and `type`."
  type = list(object({
    name         = string
    country_code = optional(string, null)
    type         = optional(string, null)
    description  = optional(string, null)
    prefix       = optional(string, null)
    region       = optional(string, null)
  }))
  default = []
}