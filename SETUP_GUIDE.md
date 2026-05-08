# Spring Boot Application Configuration Guide

## Database Configuration

Update `src/main/resources/application.properties` with your MySQL credentials:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/springboot_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=root
```

**Note:** Replace `root` with your actual MySQL username and password.

## Quick Start

### 1. Setup MySQL Database
```bash
# Connect to MySQL
mysql -u root -p

# Run the initialization script
mysql -u root -p < database-init.sql
```

### 2. Build the Project
```bash
mvn clean install
```

### 3. Run the Application
```bash
mvn spring-boot:run
```

### 4. Test the API
```bash
# Get all users
curl http://localhost:8080/api/users

# Create a user
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@example.com","phone":"1234567890"}'

# Get specific user
curl http://localhost:8080/api/users/1

# Update user
curl -X PUT http://localhost:8080/api/users/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"John Updated","email":"john.updated@example.com","phone":"9876543210"}'

# Delete user
curl -X DELETE http://localhost:8080/api/users/1
```

## Project Features

- REST API with CRUD operations
- JPA/Hibernate ORM
- MySQL database integration
- Global exception handling
- Lombok for reducing boilerplate
- Spring Boot DevTools for hot reload
- Comprehensive logging

## Project Layout

```
Java_Springboot_App/
├── pom.xml                          # Maven configuration
├── README.md                        # Documentation
├── database-init.sql               # Database initialization script
├── SETUP_GUIDE.md                  # This file
├── src/
│   ├── main/
│   │   ├── java/com/springboot/
│   │   │   ├── JavaSpringbootAppApplication.java
│   │   │   ├── controller/UserController.java
│   │   │   ├── service/UserService.java
│   │   │   ├── repository/UserRepository.java
│   │   │   ├── entity/User.java
│   │   │   └── exception/GlobalExceptionHandler.java
│   │   └── resources/
│   │       └── application.properties
│   └── test/
│       └── java/com/springboot/JavaSpringbootAppApplicationTests.java
└── target/                         # Build output (generated)
```

## Common Issues

### Issue: "Cannot connect to database"
- Verify MySQL is running: `mysql -u root -p`
- Check database exists: `SHOW DATABASES;`
- Verify credentials in `application.properties`

### Issue: Maven build fails
- Check Java version: `java -version` (should be 17+)
- Clear cache: `mvn clean`
- Reinstall dependencies: `mvn install`

### Issue: Port 8080 already in use
- Change port in `application.properties`: `server.port=8081`

## Next Steps

- Add more entities and controllers for other business domains
- Implement authentication/authorization (Spring Security)
- Add API documentation (Springdoc OpenAPI/Swagger)
- Implement service layer validation
- Add database migrations (Flyway)
- Set up CI/CD pipeline
