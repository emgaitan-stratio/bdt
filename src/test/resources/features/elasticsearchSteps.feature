@rest
Feature: Elasticsearch steps test

  Scenario: Connect to Elasticsearch
    Given I connect to Elasticsearch cluster at host '${ES_NODE:-127.0.0.1}' using native port '${ES_PORT:-9200}'
    Given I connect to 'Elasticsearch' cluster at '${ES_NODE:-127.0.0.1}'

  Scenario: Obtain clustername in Elasticsearch
    Given I obtain elasticsearch cluster name in '${ES_NODE:-127.0.0.1}:${ES_PORT:-9200}' and save it in variable 'clusternameES'

  Scenario: Create new index in Elasticsearch
    Given I create an elasticsearch index named 'indexes' removing existing index if exist
    Then An elasticsearch index named 'indexes' exists

  Scenario: Connect to Elasticsearch with params
    Given I drop an elasticsearch index named 'indexes'
    Given An elasticsearch index named 'indexes' does not exist

  Scenario: Drop Elasticsearch indexes
    Given I drop every existing elasticsearch index

  Scenario: Connect to Elasticsearch with clustername obtained
    Given I connect to Elasticsearch cluster at host '${ES_NODE:-127.0.0.1}' using native port '${ES_PORT:-9200}' using cluster name '!{clusternameES}'
