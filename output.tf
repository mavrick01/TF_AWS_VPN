output "emp_web" {
  description = "ID of the EC2 instance"
  value       = aws_instance.emp_web.id
  }

output "emp_web_ip"  {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.emp_web.private_ip
}

output "all_web" {
  description = "ID of the EC2 instance"
  value       = aws_instance.all_web.id
  }

output "all_web_ip"  {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.all_web.private_ip
}

output "tunnel_1" {
  description = "VPN Tunnel 1"
  value       = aws_vpn_connection.vpn1.tunnel1_address
  }

output "tunnel_2" {
  description = "VPN Tunnel 2"
  value       = aws_vpn_connection.vpn1.tunnel2_address
  }

output "tunnel_2_cgw" {
  description = "VPN Tunnel 1 Inside address"
  value       = aws_vpn_connection.vpn1.tunnel1_cgw_inside_address
  }  