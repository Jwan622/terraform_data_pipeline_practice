resource "aws_redshift_cluster" "jwan_cluster" {
  cluster_identifier      = "jwan-my-cluster"
  node_type               = "dc2.large"
  number_of_nodes         = 1
  database_name           = "jwandb"
  master_username         = "jwanuser"
  master_password         = "SomePassword1"
  skip_final_snapshot     = true

  cluster_subnet_group_name = var.subnet_group_name
  vpc_security_group_ids    = [var.vpc_id]
}
