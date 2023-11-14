variable "ami_name" {
}
variable "instance_type" {
}

data "aws_ami" "Devops-Image" {
  most_recent = true
  owners = ["self"]

  filter {
    name   = "tags:Name"
    values = [var.ami_name]
  }
  depends_on = [ aws_instance.terraform_ec2 ]
}

resource "aws_instance" "terraform_ec2" {
  ami           = data.aws_ami.Devops-Image.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.terraform_subnet.id
  tags = {
    Name = "terraform-instance"
  }
}