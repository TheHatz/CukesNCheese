Feature: Admining puppies
  As a puppy lover site admin
  I want to be able to process puppy orders
  So that puppy adopters can received their puppies


Background:
  Given I am on the puppy adoption site


 Scenario: Verify  message when adoption is processed
   Given  I have a pending adoption for "Ddig"
   When   I process that adoption
   Then   I should see "Please thank Ddig for the order!"

 Scenario: Delivered on date should be set when a puppy is processed
   Given  I have a pending adoption for "Puppy Lover"
   When   I process that adoption
   Then   the adoption delivered on date should be set to the current time






