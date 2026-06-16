variable "project_name" {
    description="Project name"
    type=string
}
variable "region" {
    description="Region name"
    type=string

}
variable "cidr_block" {
    description="CIDR for vpc"
    type=string

}
variable "public_subnet_cidr" {
    description="CIDR for public subnet"
    type=string

}