output "load_balancer_dns_name" {
  description = "Nombre DNS del balanceador de carga"
  value       = aws_lb.load_balancer.dns_name
}