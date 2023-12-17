resource "aws_subnet" "jwan_subnet" {
  vpc_id                  = aws_vpc.jwan_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "jwan-subnet"
  }
}
