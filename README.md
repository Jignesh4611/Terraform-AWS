# Terraform AWS infrastructure (AWS+VPC)

# Summery
Provisions a custom VPC, public subnet, internet gateway, and one EC2 (t3.micro) using Terraform modules.

## Architecture
```text
[Internet] → [IGW] → [VPC] → [Public Subnet] → [EC2 t2.micro]
```
## Quick Start
```bash
terraform init
terraform plan
terraform apply
```
## Access EC2
```bash
terraform output public_ip
# Open http://<public_ip> in browser
```

## State Management
- Remote state stored in S3: `jignesh-terraform-state`
- Versioning enabled for state file recovery

## Modules
- `modules/vpc/` — VPC, subnet, IGW, route tables
- `modules/ec2/` — Security group, EC2 instance, user data