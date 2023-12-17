# Terraform Errors

Here are some errors I encountered while using terraform

1. I need to install modules first before running `terraform plan`. You can see this during the `plan` phase. An error message I saw:
```bash
Error: Module not installed
│
│   on main.tf line 18:
│   18: module "vpc" {
│
│ This module is not yet installed. Run "terraform init" to install all modules required by this configuration.
╵
╷
│ Error: Module not installed
│
│   on main.tf line 49:
│   49: module "sg" {
│
│ This module is not yet installed. Run "terraform init" to install all modules required by this configuration.
╵
╷
│ Error: Module not installed
│
│   on main.tf line 67:
│   67: module "redshift" {
│
│ This module is not yet installed. Run "terraform init" to install all modules required by this configuration.
```


2. When running `terraform_plan` sometimes I might not have variables or modules wired up correctly:
```bash
terraform plan
╷
│ Error: Incorrect attribute value type
│
│   on redshift_test/cluster.tf line 10, in resource "aws_redshift_cluster" "jwan_cluster":
│   10:   cluster_subnet_group_name = var.subnet_ids
│     ├────────────────
│     │ var.subnet_ids is a list of string
│
│ Inappropriate value for attribute "cluster_subnet_group_name": string required.
```

To me, the value should `var.subnet_group_name` but what do we need to wire this up correctly?

First I need to create a variable in the `variables.tf` file like so:

```bash
variable "subnet_group_name" {
  description = "Subnet group name from vpc_and_subnet.subnet_group.tf file"
}
```

This tells terraform that I then need to pass in a variable to this module like so:

```bash
module "redshift" {
  source = "./redshift_test"

  ...
  subnet_ids = module.vpc_and_subnet.jwan_subnet_ids  # Replace with correct reference
  subnet_group_name = module.vpc_and_subnet.jwan_subnet_group_name  # created this myself, hope this works.
}
```

I also need to expose that variable via an `output.tf` file and the `main.tf` file:

```bash
output "jwan_subnet_group_name" {
  value = aws_redshift_subnet_group.jwan_subnet_group.name
}
```
and the `main.tf`:
```bash
module "vpc_and_subnet" {
  source = "./vpc_and_subnet"
}
```

and then that resource needs to exist in the folder:

```bash
resource "aws_redshift_subnet_group" "jwan_subnet_group" {
  name       = "jwan-subnet-group"
  subnet_ids = [for s in aws_subnet.jwan_subnet : s.id]
}
```
