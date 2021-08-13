# 2 Tier Deployment with Virtual Machine Scale Set SQL Database & Bastion
This plan is used to build 2-tier infrastructure in two different avalibility zones and application load balancer.

Tier 1 - Web Servers
Tier 2 - MySQL DB 
## What Does this plan do ?
A total of 21 resources are created. Update tfvars with necessary data.
Create an key pair in EC2 and assign before executing the plan, this will help in troubleshooting any issues on EC2.

1. Creates a VPC
2. Creates 4 Subnets
3. Creates 1 Application Load Balancer
4. Creates 2 EC2 instances for Web Tier
5. Creates 1 MySQL Database
6. Creates 3 Security Groups
    * Allow HTTP Traffic from Internet to LoadBalancer
    * Allow HTTP Traffic from LoadBalancer to WebServers
    * Allow DB Traffic from WebServers to RDS

authenticate using : 
```
aws configure --profile xxxxxx
```

post configuration :

```
terraform init
terraform plan
terraform apply
```

*this is just a simple architecture and can be secured and enhanced further*