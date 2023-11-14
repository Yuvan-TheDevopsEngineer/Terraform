
module "Network-module" {
  source = "./Network-module"
  vpc_cidr = "10.0.0.0/16"
vpc_name = "terraform_vpc"
subnet_cidr = "10.0.0.0/24"
subnet_name = "terraform_subnet"
}
module "Resource-module" {
  source = "./Resource-module"
  ami_name = "Devops-Image"
instance_type = "t2.micro"
}