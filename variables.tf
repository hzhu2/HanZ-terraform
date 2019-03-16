# declare access key and secret key
variable "access_key" {}
variable "secret_key" {}

# aws provider
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "ap-southeast-1"
}

# fetching coreos AMI
data "aws_ami" "coreos" {
  filter {
    name   = "name"
    values = ["CoreOS-stable-2023.5.0-hvm"] # Fixed value to avoid recreation of instances
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["595879546273"] # CoreOS
}

# path to ssh public key
variable "public_key_path" {
  default = "~/.ssh/3-tier.pub"
}

# name of the key to be used
variable "key_name" {
  default = "HanZ-ssh-key"
}

# EC2 machine instance type 
variable "instance_type" {
  default = "t2.micro"
}
