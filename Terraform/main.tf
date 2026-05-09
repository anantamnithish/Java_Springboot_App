

# Configure Terraform Backend for State Management in S3
terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-563184259844"
    key    = "DB_terraform.tfstate"
    region = "ap-south-2"
  }
}

# RDS MySQL Database
resource "aws_db_instance" "mysql_db" {
  identifier             = "springboot-mysql-db"
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = var.db_publicly_accessible
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  tags = {
    Name = "SpringBoot MySQL DB"
  }
}

# Security Group for RDS
resource "aws_security_group" "rds_sg" {
  name_prefix = "rds-sg-"
  description = "Security group for RDS MySQL"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS Security Group"
  }
}

# DB Subnet Group (assuming default VPC)
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = data.aws_subnets.default.ids

  tags = {
    Name = "RDS Subnet Group"
  }
}

# Data source for default subnets
data "aws_subnets" "default" {
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

# EC2 Instance
resource "aws_instance" "Web" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Web Server"
  }
}
