variable "bucket_name" {
  type = string
  description = "bucket's name"
}

variable "prefix" {
  type = string
  default     = "examplecom"
  description = "The name of our org, i.e. examplecom."
}

variable "environment" {
  type = string
  default     = "development"
  description = "The name of our environment, i.e. development."
}

