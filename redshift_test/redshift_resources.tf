###########################
# Security group
# source  = "terraform-aws-modules/security-group/aws//modules/redshift"
# This specifies the source of the module. Here, the source is a predefined module from the Terraform Registry that's tailored for creating security groups specifically for Redshift. The double
# slash (//) is used to navigate to a submodule within a Terraform module.

# ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
# Defines the ingress (incoming) rules for the security group. In this case, it allows incoming traffic from IP addresses within the VPC's CIDR block. This is a common configuration to restrict # access to the Redshift cluster to only resources within the same VPC.

# egress_rules: ["all-all"]
# Specifies the egress (outgoing) rules. Here, ["all-all"] means that the security group allows all outgoing traffic to any destination. This is a broad rule and is commonly used unless you have
# specific requirements to restrict outbound traffic from your Redshift cluster.

# From and To Port: The from_port and to_port are set to 0, and the protocol is -1. This combination effectively allows all types of traffic (all ports and protocols) to enter.
# CIDR Blocks: The source for this traffic is set to 0.0.0.0/0, which means it allows traffic from any IP address on the internet. This is very permissive and not typically recommended, especially for sensitive resources like databases.
###########################

resource "aws_security_group" "jwan_security_group" {
  name        = "jwan-security-group"
  description = "Security group for Redshift cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Update this as per your requirements
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Update this as per your requirements
  }
}
