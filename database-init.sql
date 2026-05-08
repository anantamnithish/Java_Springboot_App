-- Database initialization script for Spring Boot Application

-- Create database
CREATE DATABASE IF NOT EXISTS springboot_db;

-- Use the database
USE springboot_db;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    CONSTRAINT email_unique UNIQUE KEY (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create index on email for faster queries
CREATE INDEX idx_email ON users(email);

-- Sample data (optional)
INSERT INTO users (name, email, phone) VALUES
('John Doe', 'john@example.com', '1234567890'),
('Jane Smith', 'jane@example.com', '0987654321'),
('Bob Wilson', 'bob@example.com', '5555555555');
