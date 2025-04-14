output "sta_alb_sg_id" {
  description = "sta private subnets ids"
  value       = aws_security_group.sta_alb_sg.id
}

output "sta_alb_id" {
  description = "sta public alb"
  value       = aws_lb.sta_alb.id
}

output "sta_alb_dns_name" {
  description = "sta public alb dns name"
  value       = aws_lb.sta_alb.dns_name
}

output "sta_alb_zone_id" {
  description = "sta public alb zone id"
  value       = aws_lb.sta_alb.zone_id
}

