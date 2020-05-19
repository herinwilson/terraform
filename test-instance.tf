provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = "${file("my-aws.pub")}"
}

resource "aws_instance" "test-instance" {
  ami           = "ami-02b6d9703a69265e9"
  count         = 1
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.my-key.key_name}"
  user_data     = "${file("code.sh")}"
  tenancy       = "default"

  tags = {
    Name = "test_inst"
  }
}
