terraform {
  backend "s3" {
    bucket = "shegoj-tfstate"
    key    = "terraform_state_via_jenkins"
    region = "eu-west-1"
  }
}

resource "aws_instance" "via_jenkins"  {

    ami           = "ami-06ce3edf0cff21f07"
    instance_type = "t2.micro"
    count         = 1
    key_name      = "devopsmodule"

    tags = {
        Name ="For_Jenkins"
    }
}

provider "aws" {
    region = "eu-west-1"
}
