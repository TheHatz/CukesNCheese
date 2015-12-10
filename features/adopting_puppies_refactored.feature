Feature: Adopting puppies
  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

Background:
  Given I am on the puppy adoption site

Scenario: Adopting a pulling using a table
  When I click the View Details button for "Brook"
  And  I click the Adopt Me button
  And  I click the Complete the Adoption button
  And  I complete the adoption with:
    |name|address|email|pay_type|
    |George|Broad Street|1@1.com|Check|
  Then I should see "Thank you for adopting a puppy"

Scenario: Adopting a puppy using partial default data
  When I click the View Details button for "Brook"
  And  I click the Adopt Me button
  And  I click the Complete the Adoption button
  And  I complete the adoption using a Credit card
  Then I should see "Thank you for adopting a puppy!"

Scenario: Adopting a puppy using all default data
  When I click the View Details button for "Brook"
  And  I click the Adopt Me button
  And  I click the Complete the Adoption button
  And  I complete the adoption
  Then I should see "Thank you for adopting a puppy!"

Scenario: Thank you message should be displayed
  When I complete the adoption of a puppy
  Then I should see "Thank you for adopting a puppy!"


