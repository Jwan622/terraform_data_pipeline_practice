provider "aws" {
    shared_credentials_file = "/Users/jwan/.aws/credentials"
    profile                  = "jwan"
    region                  = "${var.region}"
}

module "s3" {
    source = "./s3_test"
}

######
# VPC
# The cidr line defines the overall network range for your cloud infrastructure.
# The azs line specifies which AWS Availability Zones your resources will be distributed across.
# The redshift_subnets line specifies smaller network segments within your overall network, dedicated to Amazon Redshift instances.
######
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = "demo-vpc"

  cidr = "10.10.0.0/16"

  azs  = ["us-east-1a", "us-east-1b"]   # availability zones This is part of setting up a high-availability infrastructure, ensuring that resources are distributed across multiple geographic locations for redundancy and reliability.


  ######
  # Each entry in the list (10.10.41.0/24, 10.10.42.0/24, 10.10.43.0/24) is a subnet within the larger 10.10.0.0/16 network.
  # Each subnet uses a /24 CIDR notation, meaning that the first 24 bits of the IP addresses are reserved for the network identification, leaving the last 8 bits for host addresses.
  ######
  redshift_subnets = ["10.10.41.0/24"]
}

###########
# Redshift
###########
module "redshift" {
  source = "./redshift_test"

  cluster_identifier      = "jwan-my-cluster"
  node_type               = "dc2.large"
  number_of_nodes         = 1
  skip_final_snapshot     = true

  cluster_subnet_group_name = "jwan-subnet-group"
  vpc_security_group_ids    = ["sg-12345678"]

  vpc_id     = module.vpc_and_subnet.jwan_vpc_id  # Replace with correct reference
  subnet_ids = module.vpc_and_subnet.jwan_subnet_ids  # Replace with correct reference
  subnet_group_name = module.vpc_and_subnet.jwan_subnet_group_name  # created this myself, hope this works.
}

module "vpc_and_subnet" {
  source = "./vpc_and_subnet"
}
