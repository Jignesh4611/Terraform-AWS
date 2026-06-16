output "vpc_id" {
    description = "vpc_id"
    value=aws_vpc.main.id
}
output "subnet_id" {
    description = "Public subnet ID"
    value=aws_subnet.public.id
} 
output "igw_id" {
    description = "vpc_id"
    value=aws_internet_gateway.gw.id
}