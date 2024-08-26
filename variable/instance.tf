resource aws_instance "example" {
  ami           = var.AMIS[var.REGION]
  instance_type = "t2.micro"
  availability_zone = "ap-southeast-2a"
  key_name = "mykey"
  vpc_security_group_ids = ["sg-2193020392193209"]
}