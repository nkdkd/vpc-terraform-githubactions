# vpc\
resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy="default"

    tags ={
        name="my_vpc"
    }
  
}
# subnets
resource "aws_subnet" "vpc_subnet" {
    count = length(var.subnet_cidr)
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnet_cidr[count.index]
    availability_zone = data.aws_availability_zones.azs.names[count.index]
    map_public_ip_on_launch = true

    tags= {
        name = var.subnet_names[count.index]
    }

}
# internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        name="my-igw"
    }
  
}
# route table 
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "my_rt"
  }
}

# route table association 
resource "aws_route_table_association" "rta" {
  count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.vpc_subnet[count.index].id
  route_table_id = aws_route_table.rt.id
}