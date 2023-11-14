variable "ami_name" {
}
variable "instance_type" {
}

data "aws_ami" "Devops-Image" {
  most_recent = true
  owners = ["self"]

  filter {
    name   = "tag:Name"
    values = [var.ami_name]
  }
  
}

resource "aws_instance" "terraform_ec2" {
  ami           = data.aws_ami.Devops-Image.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.terraform_subnet.id
  tags = {
    Name = "terraform-instance"
  }
  depends_on = [ data.aws_ami.Devops-Image ]
}

output "instance_Id" {
  value = aws_instance.terraform_ec2.id
}