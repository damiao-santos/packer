packer {
    required_plugins {
        amazon = {
        source  = "github.com/hashicorp/amazon"
        version = "~> 1"
        }
    }
}

variable "ami_name" {
    type = string
    default = ""
}

variable "version" {
    type = string
    default = ""
}

variable "script" {
    type = list(string)
    default = []
}

source "amazon-ebs" "ubuntu" {
    ami_name = "${var.ami_name}.${var.version}"
    source_ami = "ami-0e83be366243f524a"
    instance_type = "t2.micro"
    ssh_username = "ubuntu"
}

build {
    sources = ["source.amazon-ebs.ubuntu"]
    provisioner "shell" {
        scripts = var.script
    }
}