
variable "aws_region" {
   description = "region-singapore"
   default     = "ap-southeast-1"
}
variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}
variable "public_azs" {
   default = ["ap-southeast-1a","ap-southeast-1b"]
}
variable "public_cidr_blocks" {
   default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "pvt_azs" {
   default = ["ap-southeast-1a","ap-southeast-1a","ap-southeast-1b","ap-southeast-1b"] 
}
variable "private_cidr_blocks" {
   default = ["10.0.3.0/24","10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
}
variable "public_route_table" {
    default = ["01","02"]
}
variable "private_route_table" {
    default = ["01","02","03","04"]
}




variable "ami" {
    description = "AMIs by region"
    default = {
        ap-southeast-1 = " ami-03b6f27628a4569c8 " # Ubuntu Server 18.04 LTS (HVM)
    } 
}

variable "EC2-ami" {
    description = "AMIs by Ec2"
    default = "ami-08fcd7e5213a5de61"
}

