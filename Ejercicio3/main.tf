/*
+--------------------------------
| AWS CREDENTIALS
+--------------------------------
*/
provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
}


  #-------------
  # VPC

resource "aws_vpc" "my_vpc" {
  cidr_block           = "${var.cidr_block}"
  tags = {
    Name = "tf-joseph"
  }
}



  #-------------
  # Public Subnets

resource "aws_subnet" "public" {
  count = "${length(var.public_subnet_cidr_blocks)}"

  vpc_id                  = "${aws_vpc.my_vpc.id}"
  cidr_block              = "${var.public_subnet_cidr_blocks[count.index]}"
  availability_zone       = "${var.availability_zones[count.index]}"
  map_public_ip_on_launch = true

  tags {
    Name        = "PublicSubnet"
    Project     = "${var.project}"
    Environment = "${var.environment}"
  }
}



  #-------------
  # Private Subnets


resource "aws_subnet" "private" {
  count = "${length(var.private_subnet_cidr_blocks)}"

  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.private_subnet_cidr_blocks[count.index]}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags {
    Name        = "PrivateSubnet"
    Project     = "${var.project}"
    Environment = "${var.environment}"
  }
}

