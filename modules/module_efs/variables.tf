variable "creation_token" {
  description = "A unique string value to identify this file system."
}

variable "performance_mode" {
  description = "The performance mode of the file system. Can be 'generalPurpose' or 'maxIO'."
  default     = "generalPurpose"
}

variable "encrypted" {
  description = "A boolean flag to enable/disable encryption for the file system."
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs in which EFS mount targets will be created."
  type    = list(string)
}

variable "security_group_id" {
  description = "Security group ID to associate with the EFS mount targets."
}