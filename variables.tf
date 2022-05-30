# Variable declarations
variable "aws_region" {
  description = "Region to operate in"
  type = string
  default = "us-west-2"
}

variable "aws_profile" {
  description = "AWS Account for this to work in, if not set via export TF_VAR_aws_profile=<XXX>"
  type = string
}

variable "aws_vpc_name" {
  description = "Name of the VPC"
  type = string
  default = "VPC1"
}

variable "aws_vpc_cidr" {
  description = "Set a specific CIDR for the VPC in aws_vpc_name"
  type = string
  default = "192.168.251.0/24"
}

variable "aws_vpc_sn_name" {
  description = "Name of the Subnet"
  type = string
  default = "Subnet1"
}

variable "aws_vpc_sn_cidr" {
  description = "Set a specific subnet for the VPC in aws_vpc_name"
  type = string
  default = "192.168.251.0/24"
}
variable "aws_rt_name" {
  description = "name of the route on the other end of the gateway links"
  type = string
  default = "Route1"
}

variable "aws_rt_cidr" {
  description = "Route on the other end of the gateway links"
  type = string
  default = "10.3.3.0/24"
}

variable "tunnel1_key" {
  description = "Pre-shared key for VPN tunnel1"
  type = string
  default = "myspecialkey"
}

variable "tunnel1_cidr" {
  description = "network subnet for for VPN tunnel1"
  type = string
  default = "169.254.10.8/30"
}

variable "tunnel2_key" {
  description = "Pre-shared key for VPN tunnel2"
  type = string
  default = "myspecialkey"
}

variable "tunnel2_cidr" {
  description = "network subnet for for VPN tunnel2"
  type = string
  default = "169.254.20.8/30"
}

variable "cust_gw_name" {
  description = "name of the customer gateway"
  default = "customer_gateway_1"
}

variable "cust_gw_asn" {
  description = "ASN to use for the customer gateway"
  default = 65000
}

variable "cust_gw_ip" {
  description = "IP Lookback for the customer gateway"
  type = string
  default = "134.238.245.109"
}

variable "vpn_gw_name" {
  description = "name of the VPN gateway"
  default = "vpn_gateway_1"
}