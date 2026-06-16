resource "aws_security_group" "app_sg"{
    name= "${var.project_name}-app-sg"
    description="Security group for app server"
    vpc_id = var.vpc_id

    ingress {
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]

    }
    ingress {
        from_port=80
        to_port=80
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]

    }
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
    tags= {
        Name= "${var.project_name}-app-sg"
    }
}
resource "aws_instance" "app" {
    ami= data.aws_ami.amazon_linux_2.id
    instance_type =var.instance_type
    subnet_id=var.subnet_id
    vpc_security_group_ids = [aws_security_group.app_sg.id]

    user_data = <<-EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello from Terraform provisioned EC2</h1>" > /var/www/html/index.html
EOF
    
    tags= {
        Name="${var.project_name}-app-server"
    }
}
data "aws_ami" "amazon_linux_2" {
    most_recent = true
    owners= ["amazon"]

    filter {
        name="name"
         values = ["amzn2-ami-hvm-*-x86_64-gp2"]   
    }

}
