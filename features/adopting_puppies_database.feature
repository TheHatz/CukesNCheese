Feature: Using the database in our tests

  Scenario: Creating a new order in the database
    Given I know how many orders I have
    When  I create a new order
    Then  I should have 1 additional order

   Scenario: Time to read an order object from the database
     Given I have an order for "George"
     When  I read that order
     Then  the order should have the name "George"

  Scenario: Time to update an order object
    Given I have an order for "Daffy Duck"
    When  I update the name to "Daffy"
    Then  I should have a record for "Daffy"
    And   I should not have a record for "Daffy Duck"


  Scenario: Time to delete an order object
    Given I have an order for "Daisy"
    When  I delete that order
    Then  I should not have a record for "Daisy"