output "sta_vpc_id" {
  description = "sta subnet private 1"
  value       = module.vpc.vpc_id
}

output "sta_private_subnets_ids" {
  description = "sta private subnets ids"
  value       = module.vpc.private_subnets
}

output "sta_public_subnets_ids" {
  description = "sta public subnets ids"
  value       = module.vpc.public_subnets
}

