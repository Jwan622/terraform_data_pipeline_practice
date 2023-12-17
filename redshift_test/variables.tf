variable "cluster_identifier" {
  description = "Identifier for the Redshift cluster"
  type        = string
}

variable "node_type" {
  description = "Node type of the Redshift cluster"
  type        = string
}

variable "number_of_nodes" {
  description = "Number of nodes in the Redshift cluster"
  type        = number
}

# Define other variables like database_name, master_username, master_password, etc.

variable "skip_final_snapshot" {
  description = "Determines whether to skip the final snapshot before deleting the cluster"
  type        = bool
  default     = true
}

variable "cluster_subnet_group_name" {
  description = "The name of a cluster subnet group to be associated with this cluster"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID where the Redshift cluster will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Redshift cluster"
  type        = list(string)
}

variable "subnet_group_name" {
  description = "Subnet group name from vpc_and_subnet.subnet_group.tf file"
}

