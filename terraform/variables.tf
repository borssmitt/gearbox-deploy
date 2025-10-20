variable "region" {
  default = "eu-central-1"
}

variable "ami" {
  default = "ami-0a116fa7c861dd5f9"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "vm_rada_keypair.pem"
}
