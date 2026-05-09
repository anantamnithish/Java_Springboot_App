variable "ami" {
  description = "This instance is used to launch a web server"
  type        = string
  default     = "ami-090b9c8aa1c84aefc"
}
variable "instance_type" {
  description = "we use t3 family as instance typre"
  type        = string
  default     = "t3.micro"
}

# RDS Variables
variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "springboot_db"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  default     = "Subramanyam2175"
  sensitive   = true
}

variable "db_instance_class" {
  description = "The instance class for the RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine" {
  description = "The database engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The database engine version"
  type        = string
  default     = "8.0"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the database"
  type        = number
  default     = 20
}

variable "db_publicly_accessible" {
  description = "Whether the database is publicly accessible"
  type        = bool
  default     = false
}