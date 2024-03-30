module "vpc" {
    source = "./modulesa/vpc"
    vpc_cidr = var.vpc_cidr
    subnet_cidr = var.subnet_cidr
}
module "sg" {
    source = "./modulesa/sg"
    vpc_id = module.vpc.vpc_id
  
}
module "ec2" {
    source = "./modulesa/ec2"
    sg_id = module.sg.sg_id
    subnets = module.vpc.subnet_ids
  
}
module "alb" {
    source = "./modulesa/alb"
    instances = module.ec2.instances
    sg_id = module.sg.sg_id
    subnets = module.vpc.subnet_ids
    vpc_id = module.vpc.vpc_id
  
}