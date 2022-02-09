# TF_AWS_VPN
Setup an AWS VPN using Terraform

This is a basic terraform file to setup a VPN. It creates the following:
1) VPN
2) Subnet on VPN
3) Static route to remote network
4) VPN Gateway
5) Customer Gateway
6) VPN that ties it VPN and Customer gateway together.

To keep it simple I use static routes, but will probably add BGP later.
