## Makersharks Supplier Search API

This project provides a RESTful API to search for suppliers based on location, nature of business, and manufacturing processes.

## Project Features
 - **Pagination:** The API supports pagination for large result sets.
- **Input Validation:** Proper validation and sanitization of input parameters.
- **Exception Handling:** Robust exception handling mechanisms.
- **Unit Testing:** The application includes unit tests to ensure correct behavior of the API endpoints.
- **API Documentation:** Simple API documentation is provided using Swagger.
- **Security Considerations:** Spring Security is not implemented in this project for simplicity.
- **Database Configuration:** The database configuration is not stored in environment variables for convenience in this project.

## Prerequisites

- Java 21
- Maven
- PostgreSQL (with a local database named `maker_sharks`)


## Setting Up the Database

1. Create a local PostgreSQL database named `maker_sharks`.

  

2. Execute the provided SQL script named `sql_script.sql` to generate some data for testing.

   

## Running the Application

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/your-repository.git
    ```

2. Navigate to the project directory:

    ```bash
    cd your-repository
    ```

3. Build and run the application:

    ```bash
    mvn spring-boot:run
    ```

4. Access Swagger UI at `http://localhost:8080/swagger-ui.html`.

## API Endpoints

### Search Suppliers

- **URL:** `/api/supplier/query`
- **Method:** `POST`
- **Request Body:**
  - `location` (String)
  - `nature` (String)
  - `process` (String)
  - `page` (Integer)
  - `size` (Integer)

### Example Request

```bash
curl -X POST "http://localhost:8080/api/supplier/query" \
-H "Content-Type: application/json" \
-d '{
  "location": "Mumbai",
  "nature": "SmallScale",
  "process": "3d_printing",
  "page": 0,
  "size": 5
}'
