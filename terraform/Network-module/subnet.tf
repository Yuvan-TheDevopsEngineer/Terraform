variable "subnet_cidr" {
}
variable "subnet_name" {
}
resource "aws_subnet" "terraform_subnet" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = var.subnet_name
  }
}
output "subnet_id" {
    value = aws_subnet.terraform_subnet.id
}
