Feature: Test for the home page

  Background: Define URL
    Given url apiUrl


  Scenario: Get all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['Zoom', 'Git']
    And match response.tags !contains 'Hola'
    And match response.tags == "#array"
    And match each response.tags == "#string"
    And match response.tags contains 'QA Skills'


  Scenario: Get 10 articles from the page
    Given  params { limt: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles == '#[10]'
