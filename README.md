# 3-tier-app-aws-terraform
Simple 3-tier app example deployed to AWS using Terraform.

# Requirements
- Terraform >= `0.11.12`
- `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` can be put in variables.tf or treated as environment variables to be exported.

# Usage
Clone this repository and run:

Initializing Terrraform
```
~/HanZ-terraform/terraform init 
```

Terraform plan:
```
~/HanZ-terraform/terraform plan
```

Terraform apply:
```
~/HanZ-terraform/terraform apply
```

After the process is completed, EC2 Instance IP will be showing on the CMD.

Access applications via `http://EC2_INSTANCE_IP/app1` and `http://EC2_INSTANCE_IP/app2` in your browser.

# References
- https://github.com/lbracken/docker-example (for the example 3-tier application)
- https://www.terraform.io/docs/index.html
- https://nickcharlton.net/posts/terraform-aws-vpc.html (provided me a quick overview of resources to be created after the VPC, like proper route association)
