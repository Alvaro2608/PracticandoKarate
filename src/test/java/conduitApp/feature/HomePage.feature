Feature: Test for the home page

  Background: Define URL
    Given url 'https://conduit-api.bondaracademy.com/api/'

  Scenario: Get all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains ['Coding', 'Git']
    And match response.tags !contains 'Hola'
    And match response.tags == "#array"
    And match each response.tags == "#stringcls"
#    And match response.tags contains 'Zoom'


    Scenario: Get 10 articles from the page
#      Given param limit = 10
#      Given param offset = 0
      Given  params { limt: 10, offset: 0}
      Given path 'articles'
      When method Get
      Then status 200
      And match response.articles == '#[10]'