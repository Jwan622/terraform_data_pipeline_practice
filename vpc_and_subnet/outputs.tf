output "jwan_vpc_id" {
  value = aws_vpc.jwan_vpc.id
}

output "jwan_subnet_ids" {
  value = [aws_subnet.jwan_subnet.id]
}

output "jwan_subnet_group_name" {
  value = aws_redshift_subnet_group.jwan_subnet_group.name
}
