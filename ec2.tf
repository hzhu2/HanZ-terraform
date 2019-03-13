# creating new keypair in EC2
resource "aws_key_pair" "auth" {
  key_name   = "${ var.key_name }"
  public_key = "${ file(var.public_key_path) }"
}

# creating EC2 instance with given userdata to initialize the applications we need in this example
resource "aws_instance" "HanZ-three-tier" {
  ami = "${ data.aws_ami.coreos.id }"

  instance_type = "${ var.instance_type }"
  key_name      = "${ var.key_name }"

  source_dest_check           = false
  subnet_id                   = "${ aws_subnet.public_subnet.id }" # using a public subnet for external availability
  associate_public_ip_address = true                               # adding a public IP to it, so we can access from outside

  tags {
    BuiltWith = "terraform"
    Name      = "HanZ-three-tier"
  }

  vpc_security_group_ids = ["${ aws_security_group.HanZ-three-tier-security-group.id }"] # attaching security group

  user_data = "${ data.template_file.user_data.rendered }" # adding the user data
}

# resource that renders the userdata template
data "template_file" "user_data" {
  template = "${ file("user-data.tpl") }" # no extra variables here so just passing the plain file
}


# output EC2 public IP
output "EC2_IP" {
  value = "${ aws_instance.HanZ-three-tier.public_ip }"
}