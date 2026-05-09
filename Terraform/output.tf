output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.Web.public_ip
}

output "instance_public_dns" {
  description = "The public DNS name of the EC2 instance"
  value       = aws_instance.Web.public_dns
}

# RDS Outputs
output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.mysql_db.endpoint
}

output "rds_address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.mysql_db.address
}

output "rds_port" {
  description = "The port of the RDS instance"
  value       = aws_db_instance.mysql_db.port
}

output "rds_db_name" {
  description = "The name of the database"
  value       = aws_db_instance.mysql_db.db_name
}

output "rds_username" {
  description = "The username for the database"
  value       = aws_db_instance.mysql_db.username
}

output "rds_status" {
  description = "The status of the RDS instance"
  value       = aws_db_instance.mysql_db.status
}