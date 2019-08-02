variable "aws_region" {
  description = "Region for the VPC"
  default     = "ap-southeast-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_1" {
  description = "CIDR for the public subnet 1"
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_2" {
  description = "CIDR for the public subnet 2"
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_1" {
  description = "CIDR for the private subnet 1"
  default     = "10.0.3.0/24"
}

variable "private_subnet_cidr_2" {
  description = "CIDR for the private subnet 2"
  default     = "10.0.4.0/24"
}

variable "private_subnet_cidr_3" {
  description = "CIDR for the private subnet 2"
  default     = "10.0.5.0/24"
}

variable "private_subnet_cidr_4" {
  description = "CIDR for the private subnet 3"
  default     = "10.0.6.0/24"
}

