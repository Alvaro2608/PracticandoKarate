Feature: Sign Up new user

  Background: Preconditions
    Given url apiUrl

  @debug
  Scenario: New user Sign Up
    Given path 'users'
    And request {"user": {"email": "pruebakarate27@test.com","password": "22345alv","username": "Alvariytomyg13"}}}
    When method Post
    Then status 201