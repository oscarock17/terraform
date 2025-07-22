provider "aws" {
  region = var.region
  profile = var.profile
}

resource "aws_launch_template" "app" {
  name_prefix   = "app-launch-"
  image_id      = var.ami_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.vpc_zone_identifier # Reemplazar
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "AppInstance"
    propagate_at_launch = true
  }
}