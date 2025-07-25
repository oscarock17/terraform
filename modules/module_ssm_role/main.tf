resource "aws_iam_role" "rol_ssm" {
  name = var.role_name
  description = var.role_description

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_managed_instance_core" {
  role       = aws_iam_role.rol_ssm.name
  policy_arn = var.policy_arn
}

resource "aws_iam_instance_profile" "instance-profile" {
  name = var.instance_profile_name
  role = aws_iam_role.rol_ssm.name
}
