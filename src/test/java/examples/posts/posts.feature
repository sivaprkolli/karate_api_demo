Feature: Posts API Tests

  Background:
    * url baseUrl

  Scenario: Get all posts
    Given path '/posts'
    When method GET
    Then status 200
    And match response == '#[100]'
    And match each response == 
      """
      {
        "userId": "#number",
        "id": "#number",
        "title": "#string",
        "body": "#string"
      }
      """

  Scenario: Get a single post
    Given path '/posts/1'
    When method GET
    Then status 200
    And match response.userId == 1
    And match response.id == 1
    And match response.title == '#string'
    And match response.body == '#string'

  Scenario: Get posts by user
    Given path '/posts'
    And param userId = 1
    When method GET
    Then status 200
    And match response == '#array'
    And assert response.length > 0
    And match each response contains { userId: 1 }

  Scenario: Create a new post
    Given path '/posts'
    And request 
      """
      {
        "title": "Test Post",
        "body": "This is a test post",
        "userId": 1
      }
      """
    When method POST
    Then status 201
    And match response.title == 'Test Post'
    And match response.body == 'This is a test post'
    And match response.userId == 1
    And match response.id == '#number'

  Scenario: Update a post
    Given path '/posts/1'
    And request 
      """
      {
        "id": 1,
        "title": "Updated Title",
        "body": "Updated body content",
        "userId": 1
      }
      """
    When method PUT
    Then status 200
    And match response.title == 'Updated Title'
    And match response.body == 'Updated body content'

  Scenario: Delete a post
    Given path '/posts/1'
    When method DELETE
    Then status 200

  Scenario Outline: Get multiple posts by ID
    Given path '/posts/<postId>'
    When method GET
    Then status 200
    And match response.id == <postId>

    Examples:
      | postId |
      | 1      |
      | 2      |
      | 3      |
