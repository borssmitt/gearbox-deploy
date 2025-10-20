provider "aws" {
  region = var.region
}

resource "aws_instance" "gear" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "gear"
  }
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/inventory.ini"
  }
}
output "public_ip" {
  value = "aws_instance.gear.public_ip"
}

