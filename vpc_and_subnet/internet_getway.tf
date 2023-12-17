resource "aws_internet_gateway" "jwan_igw" {
  vpc_id = aws_vpc.jwan_vpc.id

  tags = {
    Name = "jwan-internet-gateway"
  }
}
