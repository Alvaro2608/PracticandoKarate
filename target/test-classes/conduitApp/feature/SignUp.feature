Feature: Sign Up new user

  Background: Preconditions
    Given url apiUrl

  @debug
  Scenario: New user Sign Up
    Given def userData = {"email": "pruebakarate30@test.com","username": "Alvariytomyg16"}

    Given path 'users'
  #  And request {"user": {"email": #(userData.email),"password": "32345alv","username": #(userData.username)}}
    And request
    """
    {
    "user": {
        "email": #(userData.email),
        "password": "12345alv",
        "username": #(userData.username)
    }
}
    """
    When method Post
    Then status 201