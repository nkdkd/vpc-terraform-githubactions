output "vpc_id" {
    value = aws_vpc.my_vpc.id
  
}

output "subnet_ids" {
    value = aws_subnet.vpc_subnet.*.id
  
}