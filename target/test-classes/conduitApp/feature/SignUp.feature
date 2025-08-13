Feature: Sign Up new user

  Background: Preconditions
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()
    Given url apiUrl

  Scenario: New user Sign Up



    Given path 'users'
    And request
    """
         {
            "user": {
                "email": #(randomEmail),
                "password": "12345alv",
                "username": #(randomUsername)
            }
        }
    """
    When method Post
    Then status 201
    And match response ==
    """
        {
            "user": {
                "id": "#number",
                "email": #(randomEmail),
                "username": #(randomUsername),
                "bio": null,
                "image": "#string",
                "token": "#string"
            }
        }
    """

  Scenario Outline: Validate Sign Up error messages

    Given path 'users'
    And request
    """
         {
            "user": {
                "email": "<email>",
                "password": "<password>",
                "username": "<username>"
            }
        }
    """
    When method Post
    Then status 422
    And match response == <errorResponse>

    Examples:
      | email                   | password | username                       | errorResponse                                                      |
      | #(randomEmail)          | 12345alv | Alvariytomyg21                 | {"errors":{"username":["has already been taken"]}}                 |
      | pruebakarate39@test.com | 12345alv | #(randomUsername)              | {"errors":{"email":["has already been taken"]}}                    |
      | pruebakarate39          | 12345alv | #(randomUsername)              | {"errors":{"email":["is invalid"]}}                                |
      | #(randomEmail)          | 12345alv | Alvariytomyg211212121212121212 | {"errors":{"username":["is too long (maximum is 20 characters)"]}} |
      | #(randomEmail)          | alv      | #(randomUsername)              | {"errors":{"password":["is too short (minimum is 8 characters)"]}} |
      |                         | 12345alv | #(randomUsername)              | {"errors":{"email":["can't be blank"]}}                            |
      | #(randomEmail)          |          | #(randomUsername)              | {"errors":{"password":["can't be blank"]}}                         |
      | #(randomEmail)          | 12345alv |                                | {"errors":{"username":["can't be blank"]}}                         |
