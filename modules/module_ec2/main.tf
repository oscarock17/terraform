resource "aws_instance" "ec2_instances" {
  count           = var.instance_count
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_ids[count.index]
  iam_instance_profile = var.iam_instance_profile
  vpc_security_group_ids = var.security_group_ids
  user_data = var.user_data

  tags = {
    Name = "${var.instance_name}-${count.index + 1}"
    env = var.tags_environment
  }
}
