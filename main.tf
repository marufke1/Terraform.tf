

provider "aws" {
      region = "ap-south-1"
      Access_key="xxx"
      Secret_key= "xxx"
                }

resource "aws_vpc" "vpc" {
cidr_block = "${var.vpc-cidr}"
instance_tenancy        = "default"
enable_dns_hostnames    = true
tags      = {
Name    = "Test_VPC"
}
}

resource "aws_internet_gateway" "internet-gateway" {
vpc_id    = aws_vpc.vpc.id
tags = {
Name    = "internet_gateway"
}
}

resource "aws_subnet" "public-subnet-1" {
vpc_id                  = aws_vpc.vpc.id
cidr_block              = "${var.Public_Subnet_1}"
availability_zone       = "eu-central-1a"
map_public_ip_on_launch = true
tags      = {
Name    = "public-subnet-1"
}
}

resource "aws_route_table" "public-route-table" {
vpc_id       = aws_vpc.vpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.internet-gateway.id
}
tags       = {
Name     = "Public Route Table"
}
}

resource "aws_route_table_association" "public-subnet-1-route-table-association" {
subnet_id           = aws_subnet.public-subnet-1.id
route_table_id      = aws_route_table.public-route-table.id
}

resource "aws_subnet" "private-subnet-1" {
vpc_id                   = aws_vpc.vpc.id
cidr_block               = "${var.Private_Subnet_1}"
availability_zone        = "eu-central-1a"
map_public_ip_on_launch  = false
tags      = {
Name    = "private-subnet-1"
}
}

resource "aws_security_group" "ssh-security-group" {
name        = "SSH Security Group"
description = "Enable SSH access on Port 22"
vpc_id      = aws_vpc.vpc.id
ingress {
description      = "SSH Access"
from_port        = 22
to_port          = 22
protocol         = "tcp"
cidr_blocks      = ["${var.ssh-location}"]
}
egress {
from_port        = 0
to_port          = 0
protocol         = "-1"
cidr_blocks      = ["0.0.0.0/0"]
}
tags   = {
Name = "SSH Security Group"
}
}

resource "aws_security_group" "webserver-security-group" {
name        = "Web Server Security Group"
description = "Enable HTTP/HTTPS access on Port 80/443 via ALB and SSH access on Port 22 via SSH SG"
vpc_id      = aws_vpc.vpc.id
ingress {
description      = "SSH Access"
from_port        = 22
to_port          = 22
protocol         = "tcp"
security_groups  = ["${aws_security_group.ssh-security-group.id}"]
}
egress {
from_port        = 0
to_port          = 0
protocol         = "-1"
cidr_blocks      = ["0.0.0.0/0"]
}
tags   = {
Name = "Web Server Security Group"
}
}

resource "aws_instance" "ec2_public" {
ami                    = "ami-0eb7496c2e0403237"
instance_type               = "${var.instance_type}"
key_name                    = "${var.key_name}"
security_groups             = ["${aws_security_group.ssh-security-group.id}"]
subnet_id                   = "${aws_subnet.public-subnet-1.id}"
associate_public_ip_address = true
#user_data                   = "${data.template_file.provision.rendered}"
#iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
lifecycle {
create_before_destroy = true
}
tags = {
"Name" = "EC2-PUBLIC"
}
# Copies the ssh key file to home dir
# Copies the ssh key file to home dir
provisioner "file" {
source      = "./${var.key_name}.pem"
destination = "/home/ec2-user/${var.key_name}.pem"
connection {
type        = "ssh"
user        = "ec2-user"
private_key = file("${var.key_name}.pem")
host        = self.public_ip
}
}
//chmod key 400 on EC2 instance
provisioner "remote-exec" {
inline = ["chmod 400 ~/${var.key_name}.pem"]
connection {
type        = "ssh"
user        = "ec2-user"
private_key = file("${var.key_name}.pem")
host        = self.public_ip
}
}
}

resource "aws_instance" "ec2_private" {
#name_prefix                 = "terraform-example-web-instance"
ami                    = "ami-0eb7496c2e0403237"
instance_type               = "${var.instance_type}"
key_name                    = "${var.key_name}"
security_groups             = ["${aws_security_group.webserver-security-group.id}"]
subnet_id                   = "${aws_subnet.private-subnet-1.id}"
associate_public_ip_address = false
#user_data                   = "${data.template_file.provision.rendered}"
#iam_instance_profile = "${aws_iam_instance_profile.some_profile.id}"
lifecycle {
create_before_destroy = true
}
tags = {
"Name" = "EC2-Private"
}
}


