resource "aws_instance" "emp_web" {
    ami = "ami-0b7b42cec9b59c59b" #"ami-0ca285d4c2cda3300"  #Amazon Linix 2 
    instance_type = "t3a.micro"
    vpc_security_group_ids = [aws_security_group.emp_web_sg.id]
    subnet_id = aws_subnet.subnet1.id
    private_ip = "192.168.251.100"
    user_data = <<EOF
#!/bin/bash
MYIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer for Everyone with IP: $MYIP</h2><br>Build by Terraform"  >  /opt/bitnami/nginx/html/index2.html
EOF
    tags = {
        Name = "Employee Server built by Terraform"
        Owner = "mgollop"
    }
}

resource "aws_instance" "all_web" {
    ami = "ami-083c2353904797547"  #Amazon Linix 2 
    instance_type = "t3a.micro"
    vpc_security_group_ids = [aws_security_group.all_web_sg.id]
    subnet_id = aws_subnet.subnet1.id
    private_ip = "192.168.251.50"
    user_data = <<EOF
#!/bin/bash
MYIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WebServer for Everyone with IP: $MYIP</h2><br>Build by Terraform"  >  /opt/bitnami/nginx/html/index2.html
EOF
    tags = {
        Name = "All Users Server built by Terraform"
        Owner = "mgollop"
    }
}

resource "aws_security_group" "emp_web_sg" {
    name = "emp-webserver-SG"
    description = "Security group for the employee web server"
    vpc_id = aws_vpc.vpc1.id
    ingress {
        description = "Allow ICMP"
        from_port = -1
        to_port = -1        
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow SSH"
        from_port = 22
        to_port = 22        
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow HTTP"
        from_port = 80
        to_port = 80        
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow HTTPS"
        from_port = 443
        to_port = 443        
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Allow All Ports"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Employee Only Server SG built by Terraform"
        Owner = "mgollop"
    }
}

resource "aws_security_group" "all_web_sg" {
    name = "all-webserver-SG"
    description = "Security group for the employee web server"
    vpc_id = aws_vpc.vpc1.id
    ingress {
        description = "Allow ICMP"
        from_port = -1
        to_port = -1        
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow SSH"
        from_port = 22
        to_port = 22        
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow HTTP"
        from_port = 80
        to_port = 80        
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow HTTPS"
        from_port = 443
        to_port = 443        
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Allow All Ports"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Everyones Servers SG built by Terraform"
        Owner = "mgollop"
    }
}