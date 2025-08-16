resource "aws_vpc" "flask_server" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    name = "flask_server_vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.flask_server.id
  cidr_block = "10.0.1.0/24"

  tags = {
    name = "flask_server_public_subnet"
  }
}

resource "aws_internet_gateway" "flask_server_igw" {
  vpc_id = aws_vpc.flask_server.id
  tags = {
    name = "flask_server_igw"
  }
}

resource "aws_route_table" "flask_server_rtb_public" {
  vpc_id = aws_vpc.flask_server.id

  tags = {
    name = "flask-server-public-rt"
  }
}

resource "aws_route" "flask_server_rtb_public_route" {
  route_table_id         = aws_route_table.flask_server_rtb_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.flask_server_igw.id
}

resource "aws_route_table_association" "flask_server_public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.flask_server_rtb_public.id
}
