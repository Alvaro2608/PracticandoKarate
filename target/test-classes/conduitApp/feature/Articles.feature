Feature: Articles

  Background: Define URL
    Given url 'https://conduit-api.bondaracademy.com/api/'
    Given path 'users/login'
    And request {"user": {"email": "pruebakarate@test.com","password": "karate123"}}
    When method Post
    Then status 200
    * def token = response.user.token

  Scenario: Create a new article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"title": "Probando Articulo6","description": "es una prueba6","body": "practicando Karate6","tagList": []}}
    When method Post
    Then status 201
    And match response.article.title == 'Probando Articulo6'