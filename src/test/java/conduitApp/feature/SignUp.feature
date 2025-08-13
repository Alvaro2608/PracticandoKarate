Feature: Sign Up new user

  Background: Preconditions
    * def dataGenerator = Java.type('helpers.DataGenerator')
    Given url apiUrl

  @debug
  Scenario: New user Sign Up

    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()

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