variable "instance_arn" {
  type        = string
  description = "The ARN of the Amazon Connect instance."
}

variable "prompt_name" {
  type        = string
  description = "The name of the Amazon Connect prompt."
}

variable "prompt_description" {
  type        = string
  description = "The description of the Amazon Connect prompt."
}

variable "s3_bucket" {
  type        = string
  description = "The S3 bucket where the prompt file is stored."
}

variable "s3_key" {
  type        = string
  description = "The S3 key for the prompt file."
}

variable "prompt_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to the prompt resource."
}