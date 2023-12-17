# Description

The purpose of this test repo is to:
1. Become more familiar with terraform
2. Write python commands to store avro files in s3 by timestamp
3. Move avro files to Redshift (also created by terraform)
4. Dockerize the python click commands


# Terraform commands to remember:

1. This saves the terraform plan to a binary file called `s3_plan`
```bash
terraform plan -out s3_plan
```

2. To install modules:

```bash
terraform init
```


You'll see output like this:
```bash
Initializing the backend...
Initializing modules...
- redshift in ../..
Downloading registry.terraform.io/terraform-aws-modules/security-group/aws 4.17.2 for sg...
- sg in .terraform/modules/sg/modules/redshift
- sg.sg in .terraform/modules/sg
Downloading registry.terraform.io/terraform-aws-modules/vpc/aws 3.19.0 for vpc...
- vpc in .terraform/modules/vpc
```


3. To Apply:
```bash
terraform apply
```

and then you'll see output and new files like `terraform.tfstate` and `terraform.tfstate.lock.info`

4. To destroy everything so we're not charged a bunch of money for Redshift:

```bash
terraform destroy
```

you should see something like this:

```bash
Plan: 0 to add, 0 to change, 13 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value:
```

# Notes
I took some notes on the whole thing including understanding the various AWS services. The notes are here:
- [AWS Roles and Users](docs/aws_review.md)
- [VPCs](docs/vpc.md)
- [Internet gateway](docs/internet_gateway.md)
- [Security Groups](docs/security_group.md)
- [Some terraform basics](docs/about_terraform.md)
- [Some terraform errors I saw](docs/some_common_terraform_errors.md)

