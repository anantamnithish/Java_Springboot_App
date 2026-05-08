# Java Spring Boot Web Application

A complete Spring Boot web application with Java backend, MySQL database, and Maven build tool.

## Project Structure

```
src/
├── main/
│   ├── java/com/springboot/
│   │   ├── JavaSpringbootAppApplication.java     # Main Spring Boot application
│   │   ├── controller/                           # REST API Controllers
│   │   │   └── UserController.java
│   │   ├── service/                              # Business Logic
│   │   │   └── UserService.java
│   │   ├── repository/                           # Data Access Layer
│   │   │   └── UserRepository.java
│   │   └── entity/                               # JPA Entities
│   │       └── User.java
│   └── resources/
│       └── application.properties                # Configuration
└── test/
    └── java/com/springboot/
        └── JavaSpringbootAppApplicationTests.java

```

## Prerequisites

- Java 17 or higher
- Maven 3.6+
- MySQL 8.0+

## Database Setup

1. Create a MySQL database:
```sql
CREATE DATABASE springboot_db;
```

2. The application will automatically create tables on startup (configured in `application.properties` with `spring.jpa.hibernate.ddl-auto=update`).

## Building the Project

```bash
mvn clean install
```

## Running the Application

```bash
mvn spring-boot:run
```

The application will start on `http://localhost:8080`

## API Endpoints

### User Management

- **GET** `/api/users` - Get all users
- **GET** `/api/users/{id}` - Get user by ID
- **POST** `/api/users` - Create a new user
- **PUT** `/api/users/{id}` - Update user by ID
- **DELETE** `/api/users/{id}` - Delete user by ID

### Example Request

```bash
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "phone": "1234567890"
  }'
```

## Configuration

Edit `src/main/resources/application.properties` to configure:
- Database connection details
- JPA/Hibernate settings
- Logging levels
- Server port

## Technologies Used

- Spring Boot 3.2.0
- Spring Data JPA
- MySQL Connector
- Lombok
- Maven

## Testing

Run tests with:
```bash
mvn test
```

## Build JAR

Create a production-ready JAR:
```bash
mvn clean package
```

The JAR will be generated in the `target/` directory and can be run with:
```bash
java -jar target/java-springboot-app-1.0.0.jar
```
