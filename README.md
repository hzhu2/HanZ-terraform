# 3-tier-app-aws-terraform
Simple 3-tier app example deployed to AWS using Terraform.

# Requirements
- Terraform >= `0.11.12`
- `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` can be put in variables.tf or treated as environment variables to be exported.
- Create EC2 key pair and import the public key to AWS. The key pair is used to control login access to EC2 instances. <br />
Currently Terroform `aws_key_pair` resource requires an existing user-supplied key pair. This key pair's public key will be registered with AWS to allow logging-in to EC2 instances. <br />
When importing an existing key pair the public key material may be in any format supported by AWS. Supported formats (per the AWS documentation) are: <br />
    * OpenSSH public key format (the format in ~/.ssh/authorized_keys)
    * Base64 encoded DER format
    * SSH public key file format as specified in RFC4716

# Useful Info
- CoreOS version = 2023.5.0

# Architecture
![Image of architecture](https://s3-ap-southeast-1.amazonaws.com/temphanz/3-tier-v0.1.jpg)

| Custom route table        |               |
| ------------------------- |:-------------:| 
| col 3 is      | right-aligned | 
| col 2 is      | centered      | 
| zebra stripes | are neat      | 

Custom route table
Destination | Target
--- | --- | ---
10.0.0.0/16| local 
0.0.0.0/0 | igw-id

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
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html (For EC2 key pair)
- https://github.com/lbracken/docker-example (For the example 3-tier application)
- https://www.terraform.io/docs/index.html
- https://nickcharlton.net/posts/terraform-aws-vpc.html (For a quick overview of resources to be created after the VPC)
