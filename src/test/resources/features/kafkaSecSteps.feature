Feature: Kafka steps test

  Scenario: Open Kafka connection
    Given I open connection to kafka with url '${KAFKA_HOSTS}'

  Scenario: Create topic
    When I create topic '${TOPIC:-ittopic}1'
    Then topic '${TOPIC:-ittopic}1' exists
    And number of partitions in topic '${TOPIC:-ittopic}1' is '1'

  Scenario: Send message to topic
    When I send message '${MESSAGE:-itmessage}1' to topic '${TOPIC:-ittopic}1'
    And I send message '${MESSAGE:-itmessage}2' to topic '${TOPIC:-ittopic}1'
    And I wait '5' seconds
    Then topic '${TOPIC:-ittopic}1' contains '2' messages with values:
      | ${MESSAGE:-itmessage}1 |
      | ${MESSAGE:-itmessage}2 |

  @important
  Scenario: Delete topics and close connection
    When I delete topic '${TOPIC:-ittopic}1'
    Then topic '${TOPIC:-ittopic}1' does not exist
    And I close Kafka connection