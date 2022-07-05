resource "aws_vpc" "simha" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ACHARYA"
  }
}
