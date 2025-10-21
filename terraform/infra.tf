provider "aws" {
  region = var.region
}

resource "aws_security_group" "name" {

}

resource "aws_instance" "gear" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = ["sg-0ad057ef92bec5f9c"]

  tags = {
    Name = "gear"
  }
  provisioner "local-exec" {
    command = "echo '[web]\n${self.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/vm_rada_keypair.pem' > ../ansible/inventory.ini"
  }
}
output "public_ip" {
  value = "aws_instance.gear.public_ip"
}

