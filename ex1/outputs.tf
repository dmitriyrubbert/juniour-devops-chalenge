# ----------------- VPC ----------------
output "vps_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.main.id, "")
}

output "vps_arn" {
  description = "The ARN of the VPC"
  value       = try(aws_vpc.main.arn, "")
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = try(aws_vpc.main.cidr_block, "")
}

# ----------------- Subnet ----------------
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = join(",", aws_subnet.private.*.id)
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = join(",", aws_subnet.private.*.arn)
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = join(",", aws_subnet.private.*.cidr_block)
}
#===============================================
