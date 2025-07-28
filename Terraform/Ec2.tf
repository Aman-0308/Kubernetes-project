resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"
  public_key = file("/full/path/to/.ssh/id_rsa.pub")  # Replace with actual absolute path
}


module "ec2_stack" {
  source    = "git::https://github.com/your-username/your-repo.git//modules/ec2"
  key_name  = aws_key_pair.my_key_pair.key_name
  public_key = aws_key_pair.my_key_pair.public_key

  vpc_id    = module.vpc.vpc_id         # Or aws_vpc.main.id if you used a resource
  subnet_id = module.vpc.subnet_id      # Or aws_subnet.main.id if you used a resource
  ami_id    = "ami-0abcdef1234567890"   # Replace with a valid AMI ID
}
