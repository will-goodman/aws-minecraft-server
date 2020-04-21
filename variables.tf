//VPC
variable "vpc_name" {
  description = "Name to give to the VPC."
  default     = "minecraftserver"
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC."
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones to deploy the subnets to. Must be at least two."
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "public_cidr_range" {
  description = "CIDR range for the first public subnet. Must be within the VPC CIDR range."
  default     = "10.0.1.0/24"
}

variable "second_public_cidr_range" {
  description = "CIDR range for the second public subnet. Must be within the VPC CIDR range."
  default     = "10.0.3.0/24"
}

variable "private_cidr_range" {
  description = "CIDR range for the first private subnet. Must be within the VPC CIDR range."
  default     = "10.0.2.0/24"
}

variable "second_private_cidr_range" {
  description = "CIDR range for the second private subnet. Must be within the VPC CIDR range."
  default     = "10.0.4.0/24"
}

//S3
variable "bucket_prefix" {
  description = "Bucket policy to apply to the bucket"
  default     = "minecraft-server-"
}

variable "force_destroy" {
  description = "Whether or not to forceably destroy the bucket's contents on a terraform destroy. Default false"
  default     = false
}

variable "versioning" {
  description = "Whether or not to enable bucket versioning. Defaults to false"
  default     = false
}

variable "region" {
  description = "Region to create the bucket in"
  default     = "eu-west-2"
}

//EC2
variable "ssh_ip_address" {
  description = "IP address allowed to SSH into the EC2 instance."
  default     = ""
}
