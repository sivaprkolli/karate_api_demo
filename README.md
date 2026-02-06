# Karate API Testing Framework

![Karate Tests](https://github.com/sivaprkolli/KarateDemo/workflows/Karate%20API%20Tests/badge.svg)
![CI Matrix](https://github.com/sivaprkolli/KarateDemo/workflows/CI%20Matrix%20Tests/badge.svg)

This project demonstrates API testing using Karate Framework with sample tests for JSONPlaceholder API.

## Project Structure

```
KarateDemo/
├── pom.xml                                 # Maven configuration
├── src/
│   └── test/
│       └── java/
│           ├── karate-config.js           # Global Karate configuration
│           ├── TestRunner.java            # Run all tests
│           └── examples/
│               ├── users/
│               │   ├── UsersRunner.java   # Users test runner
│               │   └── users.feature      # Users API tests
│               ├── posts/
│               │   ├── PostsRunner.java   # Posts test runner
│               │   └── posts.feature      # Posts API tests
│               └── comments/
│                   ├── CommentsRunner.java # Comments test runner
│                   └── comments.feature    # Comments API tests
```

## Prerequisites

- Java 11 or higher
- Maven 3.6 or higher

## Setup

1. Make sure Java and Maven are installed:
```bash
java -version
mvn -version
```

2. Navigate to the project directory:
```bash
cd "c:\Users\SIVA REDDY\Desktop\KarateDemo"
```

3. Install dependencies:
```bash
mvn clean install -DskipTests
```

## Running Tests

### Run all tests:
```bash
mvn test
```

### Run specific test runner:
```bash
mvn test -Dtest=UsersRunner
mvn test -Dtest=PostsRunner
mvn test -Dtest=CommentsRunner
```

### Run with specific environment:
```bash
mvn test -Dkarate.env=qa
```

## Test Features

### Users API Tests (`users.feature`)
- Get all users
- Get single user by ID
- Create a new user
- Update a user (PUT)
- Patch a user (PATCH)
- Delete a user
- Verify user not found (404)

### Posts API Tests (`posts.feature`)
- Get all posts
- Get a single post
- Get posts by user
- Create a new post
- Update a post
- Delete a post
- Data-driven tests with examples

### Comments API Tests (`comments.feature`)
- Get all comments
- Get comments for a specific post
- Get a single comment
- Create a new comment

## Karate Configuration

The `karate-config.js` file contains:
- Base URL configuration for different environments (dev, qa, prod)
- Connection and read timeout settings
- Environment-specific configurations

## Test Reports

After running tests, HTML reports are generated in:
```
target/karate-reports/
```

Open `target/karate-reports/karate-summary.html` in a browser to view detailed test results.

## API Endpoint

This framework tests the JSONPlaceholder API:
- Base URL: https://jsonplaceholder.typicode.com
- Free fake API for testing and prototyping

## Features Demonstrated

- **REST API Testing**: GET, POST, PUT, PATCH, DELETE operations
- **Schema Validation**: JSON schema matching
- **Data-Driven Testing**: Scenario Outlines with Examples
- **Assertions**: Response status, headers, body validation
- **Background**: Reusable setup steps
- **Configuration Management**: Environment-specific settings
- **Test Organization**: Modular feature files and runners
- **CI/CD Integration**: GitHub Actions workflows for automated testing
- **HTML Reports**: Cucumber and Karate HTML reports with detailed results

## CI/CD with GitHub Actions

This project includes multiple GitHub Actions workflows:

### 1. Karate API Tests (`.github/workflows/karate-tests.yml`)
- Triggers on push/pull request to main and develop branches
- Runs tests on Ubuntu with Java 11
- Generates and uploads HTML reports as artifacts
- Creates test summary in GitHub Actions UI

### 2. CI Matrix Tests (`.github/workflows/ci-matrix.yml`)
- Tests across multiple operating systems (Ubuntu, Windows, macOS)
- Tests with multiple Java versions (11, 17)
- Runs weekly on schedule
- Ensures cross-platform compatibility

### 3. Test Report Publisher (`.github/workflows/test-report.yml`)
- Publishes test results as GitHub Check
- Provides detailed test report in PR comments
- Automatically triggered after test workflow completion

### Viewing CI/CD Results
- Go to the **Actions** tab in your GitHub repository
- Click on any workflow run to see details
- Download HTML reports from the **Artifacts** section
- View test summaries directly in the workflow output

## Extending Tests

To add new tests:
1. Create a new feature file in the appropriate package
2. Create a corresponding Runner class
3. Write scenarios using Gherkin syntax
4. Run tests using Maven
5. Push to GitHub to trigger automated CI/CD

## Troubleshooting

If you encounter issues:
1. Ensure Java 11+ is installed
2. Check Maven is properly configured
3. Verify internet connectivity (tests use live API)
4. Check `target/karate-reports` for detailed error logs
