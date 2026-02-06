Feature: Comments API Tests

  Background:
    * url baseUrl

  Scenario: Get all comments
    Given path '/comments'
    When method GET
    Then status 200
    And match response == '#[500]'

  Scenario: Get comments for a specific post
    Given path '/comments'
    And param postId = 1
    When method GET
    Then status 200
    And match response == '#array'
    And assert response.length > 0
    And match each response contains { postId: 1 }
    And match each response contains { id: '#number', name: '#string', email: '#string', body: '#string' }

  Scenario: Get a single comment
    Given path '/comments/1'
    When method GET
    Then status 200
    And match response.id == 1
    And match response.postId == 1
    And match response.email contains '@'

  Scenario: Create a new comment
    Given path '/comments'
    And request 
      """
      {
        "postId": 1,
        "name": "Test Comment",
        "email": "test@example.com",
        "body": "This is a test comment"
      }
      """
    When method POST
    Then status 201
    And match response.postId == 1
    And match response.name == 'Test Comment'
    And match response.email == 'test@example.com'
