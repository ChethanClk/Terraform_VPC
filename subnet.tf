resource "aws_subnet" "simha_subnet" {
  vpc_id     = aws_vpc.simha.id
  cidr_block = "10.10.0.0/26"

  tags = {
    Name = "SIMHA"
  }
}


resource "aws_subnet" "simha_subnet1" {
  vpc_id     = aws_vpc.simha.id
  cidr_block = "10.10.0.64/26"

  tags = {
    Name = "SIMHA1"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.simha.id

  tags = {
    Name = "IGW"
  }
}


resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.simha.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "RT"
  }
}




resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.simha_subnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.simha_subnet1.id
  route_table_id = aws_route_table.rt.id
}
