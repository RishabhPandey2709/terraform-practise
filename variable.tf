
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