## Outputs

Terraform outputs are a way to extract information about the infrastructure managed by Terraform. They are particularly useful for:

Displaying a subset of the resource data after Terraform runs.
Passing data to other Terraform configurations or external tools and services.
Providing users with information about the infrastructure, like IP addresses, DNS names, and database endpoints.

### Explanation of Your Output File

- `output "vpc_id"` returns the ID of the VPC created by the vpc module. This can be useful if you need to reference the VPC ID elsewhere.
- `output "security_group_id"` provides the ID of the security group created by the sg module. This is often needed when setting up other AWS resources that need to reference this security group.
- `output "redshift_cluster_id"` gives the identifier of the Redshift cluster created by the redshift module. It's helpful for administrative purposes.
- `output "redshift_cluster_port"` gives the port number on which the Redshift cluster is accessible. This is critical for configuring database connections.
