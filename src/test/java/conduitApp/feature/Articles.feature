Feature: Articles

  Background: Define URL
    Given url apiUrl

  Scenario: Create a new article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"title": "Probando Articulo9","description": "es una prueba9","body": "practicando Karate9","tagList": []}}
    When method Post
    Then status 201
    And match response.article.title == 'Probando Articulo9'

  @debug
  Scenario: Create and Delete article
    Given path 'articles'
    And request {"article": {"title": "Probando Articulo10","description": "es una prueba10","body": "practicando Karate10","tagList": []}}
    When method Post
    Then status 201
    * def idArticle = response.article.slug

#    Given  params { limt: 10, offset: 0}
#    Given path 'articles'
#    When method Get
#    Then status 200
#    And match response.articles[0].title == 'Probando Articulo9'

    Given path 'articles',idArticle
    When method Delete
    Then status 204