provider "aws" {
  region = var.aws_region
  shared_credentials_file = "$HOME/.aws/credentials"
  profile = var.aws_profile
  }

# Create a VPC
resource "aws_vpc" "vpc1" {
    cidr_block = var.aws_vpc_cidr

    tags = {
        Name = var.aws_vpc_name
    }
}

# Create the Subnet
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.aws_vpc_sn_cidr
  map_public_ip_on_launch = false
  tags = {
    Name = var.aws_vpc_sn_name
  }
}

# Create an internet gateway
# resource "aws_internet_gateway" "prisma-ig" {
#   vpc_id = aws_vpc.vpc1.id

#   tags = {
#     Name = "prisma-ig"
#   }
# }

# Create a route of the specified network (e.g. 0.0.0.0/0 to the Internet Gateway)
# resource "aws_route_table" "sn1-rt" {
#   vpc_id = aws_vpc.vpc1.id

# #   route {
# #     cidr_block = var.aws_rt_cidr
# #     gateway_id = aws_vpn_gateway.vpn_gw1.id
# #   }

#   tags = {
#     Name = var.aws_rt_name
#   }
# }

# Propagate BGP Routes from the VPN Gateway 
resource "aws_vpn_gateway_route_propagation" "sn1-rt-prop" {
  vpn_gateway_id = aws_vpn_gateway.vpn_gw1.id
  route_table_id = aws_vpc.vpc1.main_route_table_id
}

# Set up the VPN gateway, not much here.
resource "aws_vpn_gateway" "vpn_gw1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = var.vpn_gw_name
  }
}

# Set up the customer gateway, not much here except to define the BGP ASN and Public IP Address we are connecting to

  resource "aws_customer_gateway" "cust_gw1" {
  bgp_asn    = var.cust_gw_asn
  ip_address = var.cust_gw_ip
  type       = "ipsec.1"

  tags = {
    Name = var.cust_gw_name
  }
}


# Set up the VPN connection. This ties the VPN Gateway and Custome Gateway together
# We set up 2 tunnels for redundnat connections and we are setting the system up for IPSec. Currently it is only static routes
resource "aws_vpn_connection" "vpn1" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gw1.id
  customer_gateway_id = aws_customer_gateway.cust_gw1.id
  type                = "ipsec.1"
  static_routes_only  = false     # was true
  tunnel1_preshared_key = var.tunnel1_key
  tunnel1_inside_cidr = var.tunnel1_cidr
  tunnel2_preshared_key = var.tunnel2_key
  tunnel2_inside_cidr = var.tunnel2_cidr
}
