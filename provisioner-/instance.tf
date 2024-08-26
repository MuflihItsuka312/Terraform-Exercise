resource "aws_key_pair" "my_key_pair" {
  key_name   = "template"
  public_key = file("template.pub")
}

resource "aws_instance" "example" {
  ami           = var.AMIS[var.REGION]
  instance_type = "t2.micro"
  availability_zone = "ap-southeast-2a"
  key_name = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = ["sg-2193020392193209"]
  tags = {
    Name = "TerradminEC-2"
    project ="Automation"
  }
  provisioner "file" {
    source      = "sample.sh"
    destination = "tmp/sample.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x tmp/sample.sh",
      "sudo ./tmp/sample.sh",
    ]
  }
  connection {
    user = var.USER
    private_key = file("template.pem")
    host = self.public_ip
  }
}