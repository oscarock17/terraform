module "load_balancer" {
  source = "../module_load_balancer"

  target_group_name     = "test-target-group"
  target_group_port     = 80
  vpc_id                = module.my_vpc.vpc_id
  instance_ids          = module.ec2.instance_ids
  load_balancer_name    = "load-balancer-terraform"
  internal              = false
  load_balancer_type    = "application"
  subnets               = module.my_vpc.public_subnet_ids
  security_group_id     = module.security_group_elb.security_group_id
  listener_port         = 80

  health_check_path            = "/auth/login"
  health_check_interval        = 30
  health_check_timeout         = 5
  health_check_healthy_threshold   = 5
  health_check_unhealthy_threshold = 2
  health_check_matcher             = 200
}