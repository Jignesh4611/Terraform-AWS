output "instance_id"{
    description = "EC2 instance id"
    value = aws_instance.app.id
}
output "public_ip"{
    description = "EC2 public ip"
    value = aws_instance.app.public_ip
}