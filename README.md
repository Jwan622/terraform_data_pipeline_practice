# Description

The purpose of this test repo is to:
1. Become more familiar with terraform
2. write python commands to store avro files in s3 by timestamp
3. move avro files to Redshift (also created by terraform)
4. dockerize the python click commands


# Terraform commands to remember:

1. This saves the terraform plan to a binary file called `s3_plan`
```bash
terraform plan -out s3_plan
```
