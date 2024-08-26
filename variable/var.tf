

variable REGION {
  default = "ap-southeast-2"
}

variable ZONE1 {
  default = "-"
}

variable AMIS {
    type = map
default = {
    ap-southeast-2a = "ami-0c55b159cbfafe1f0"
    # us-west-2      = "ami-0c55b159cbfafe1f0"
  }
}

variable USER {
  default = "ec2-user"
}