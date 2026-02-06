Feature: Users API Tests

  Background:
    * url baseUrl
    * def expectedUser = 
      """
      {
        "id": "#number",
        "name": "#string",
        "username": "#string",
        "email": "#string",
        "address": "#object",
        "phone": "#string",
        "website": "#string",
        "company": "#object"
      }
      """

  Scenario: Get all users
    Given path '/users'
    When method GET
    Then status 200
    And match response == '#[10]'
    And match each response == expectedUser

  Scenario: Get single user by ID
    Given path '/users/1'
    When method GET
    Then status 200
    And match response.id == 1
    And match response.name == 'Leanne Graham'
    And match response.username == 'Bret'
    And match response.email == 'Sincere@april.biz'

  Scenario: Create a new user
    Given path '/users'
    And request 
      """
      {
        "name": "John Doe",
        "username": "johndoe",
        "email": "john.doe@example.com"
      }
      """
    When method POST
    Then status 201
    And match response.name == 'John Doe'
    And match response.username == 'johndoe'
    And match response.email == 'john.doe@example.com'
    And match response.id == '#number'

  Scenario: Update a user
    Given path '/users/1'
    And request 
      """
      {
        "id": 1,
        "name": "Updated Name",
        "username": "updateduser",
        "email": "updated@example.com"
      }
      """
    When method PUT
    Then status 200
    And match response.name == 'Updated Name'
    And match response.username == 'updateduser'
    And match response.id == 1

  Scenario: Patch a user
    Given path '/users/1'
    And request { "name": "Patched Name" }
    When method PATCH
    Then status 200
    And match response.name == 'Patched Name'
    And match response.id == 1

  Scenario: Delete a user
    Given path '/users/1'
    When method DELETE
    Then status 200

  Scenario: Verify user not found
    Given path '/users/999999'
    When method GET
    Then status 404
