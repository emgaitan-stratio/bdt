@rest

Feature: Simple logger test

  Scenario: Some simple request
    Given I securely send requests to 'builder.int.stratio.com:443'
    When I send a 'GET' request to '/'
    Then the service response status must be '200'
    And the service response must contain the text 'Jenkins'

  Scenario: Some simple rest request
    Given I securely send requests to 'builder.int.stratio.com:443'
    When I send a 'GET' request to '/api/json'
    Then the service response status must be '200'
    And I save element '$.views[0].url' in environment variable 'VAR'
    When I send a 'GET' request to '/!{VAR}'
    And in less than '20' seconds, checking each '2' seconds, I send a 'GET' request to '/!{VAR}' so that the response contains 'Error'
    Then the service response status must be '404' and its response must contain the text 'Error'
