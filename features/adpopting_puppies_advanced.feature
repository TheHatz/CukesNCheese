Feature: Adopting puppies
  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

Background:
  Given I am on the puppy adoption site

  Scenario Outline: Adopt the puppy named Brook
    When  I click the View Details button for "Brook"
    And   I click the Adopt Me button
    And   I click the Complete the Adoption button
    And   I enter "<name>" in the name field
    And   I enter "<address>" in the address field
    And   I enter "<email>" in the email field
    And   I select "<pay_type>" from the pay with dropdown
    And   I click the Place Order button
    Then  I should see "Thank you for adopting a puppy!"
  Examples:
    |name|address|email|pay_type|
    |George|100 Broad Street|1@1.com|Credit card|
    |Jimmy|100 Cary Street|1@3.com|Check|
    |Jerry|California|1@2.com|Check|

  Scenario: Adopting two puppies
    When  I click the View Details button for "Brook"
    And   I click the Adopt Me button
    And   I click the Adopt Another Puppy button
    And   I click the View Details button for "Hanna"
    And   I click the Adopt Me button
    And   I click the Complete the Adoption button
    And   I enter "George" in the name field
    And   I enter "100 Broad Street" in the address field
    And   I enter "1@1.com" in the email field
    And   I select "Credit card" from the pay with dropdown
    And   I click the Place Order button
    Then  I should see "Thank you for adopting a puppy!"



  Scenario: Validate cart with one puppy
    When  I click the View Details button for "Brook"
    And   I click the Adopt Me button
    Then  I should see "Brook" as the name for line item 1
    And   I should see "$34.95" as the subtotal for line item 1
    And   I should see "$34.95" as the cart total

  Scenario: Validate cart with two puppies
    When I click the View Details button for "Brook"
    And  I click the Adopt Me button
    And  I click the Adopt Another Puppy button
    And  I click the View Details button for "Hanna"
    And  I click the Adopt Me button
    Then I should see "Brook" as the name for line item 1
    And  I should see "$34.95" as the subtotal for line item 1
    And  I should see "Hanna" as the name for line item 2
    And  I should see "$22.99" as the subtotal for line item 2
    And  I should see "$57.94" as the cart total
