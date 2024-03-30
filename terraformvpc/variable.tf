variable "region" {
    description = "aws region"
    type = string
  
}
variable "vpc_cidr" {
    description = "cidr block for vpc"
    type = string
  
}
variable "subnet_cidr" {
    description = "subnets for vpc "
    type = list(string)
  
}