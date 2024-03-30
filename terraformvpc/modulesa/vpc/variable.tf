variable "vpc_cidr" {
    description = "cidr block for vpc"
    type = string
  
}
variable "subnet_cidr" {
    description = "subnets for vpc "
    type = list(string)
  
}
variable "subnet_names" {
    description = "subnet tags"
    type = list(string)
    default = [ "publicsubnet1","publicsubnet2" ]
  
}