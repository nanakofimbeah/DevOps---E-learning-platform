resource "aws_route_table" "my_rt" {
  count = length(var.subnet_cidr_blocks)

  vpc_id                  = aws_vpc.my_vpc.id

  tags = {
    Name = "PublicRouteTable-${count.index + 1}"
  }
}

resource "aws_route" "route" {
  count = length(var.subnet_cidr_blocks)

  route_table_id         = aws_route_table.my_rt[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_vpc.id
}
