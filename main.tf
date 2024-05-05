provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}



resource "aws_instance" "my_server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }


  user_data = file("${path.module}/script.sh")  
  
  provisioner "remote-exec" {
    inline = [
      "while [ ! -f /var/run/user_data_done ]; do sleep 10; done",  # Attente active
      "cd /var/www/html/nodeJs-challenge",
      "sudo systemctl stop nginx",
      "sudo docker compose up -d"
    ]
  }
  
  tags = var.tags
}
