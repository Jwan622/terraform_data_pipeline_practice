resource "aws_redshift_subnet_group" "jwan_subnet_group" {
  name       = "jwan-subnet-group"
  subnet_ids = [aws_subnet.jwan_subnet.id]
}
