output "load_balancer_dns_name" {
  description = "DNS name of the Application Load Balancer."
  value       = module.application.load_balancer_dns_name
}
