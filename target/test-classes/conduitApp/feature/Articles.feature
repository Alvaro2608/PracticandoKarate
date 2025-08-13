Feature: Articles

  Background: Define URL
    Given url apiUrl

  Scenario: Create a new article
    Given path 'articles'
    And request {"article": {"title": "Creando Articulo13","description": "es una prueba11","body": "practicando Karate11","tagList": []}}
    When method Post
    Then status 201
    And  match response.article.title == 'Creando Articulo13'


  Scenario: Create and Delete article
    Given path 'articles'
    And request {"article": {"title": "Creando Articulo14","description": "es una prueba14","body": "practicando Karate14","tagList": []}}
    When method Post
    Then status 201
    * def articleId = response.article.slug

    Given  params { limt: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title == 'Creando Articulo14'

    Given path 'articles',articleId
    When method Delete
    Then status 204

    Given  params { limt: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title != 'Creando Articulo14'