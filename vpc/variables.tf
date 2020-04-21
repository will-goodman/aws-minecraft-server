
variable "vpc_name" {
  description = "Name to assign to the VPC."
}

variable "vpc_cidr" {
  description = "CIDR range of the VPC."
}

variable "availability_zones" {
  description = "List of availability zones to deploy subnets to. Must be at least two."
  type        = list(string)

  // Feature still in experimentation
  //  validation {
  //    condition     = length(var.availability_zones) > 1
  //    error_message = "At least two availability zones must be selected."
  //  }
}

variable "public_cidr_range" {
  description = "CIDR range of the public subnet."
}

variable "second_public_cidr_range" {
  description = "CIDR range of the second public subnet."
}

variable "private_cidr_range" {
  description = "CIDR range of the private subnet."
}

variable "second_private_cidr_range" {
  description = "CIDR range of the second private subnet."
}
