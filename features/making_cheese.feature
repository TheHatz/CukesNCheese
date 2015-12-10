Feature: Making Cheese

  As a cheese maker
  I want to make cheese
  So that I can share my cheesiness


Scenario: Using the cheese machine
  Given I have no cheese
  When I press the make cheese button
  Then I should have 2 piece of cheese

Scenario Outline: Using the cheese machine
  Given I have no Cheese
  When  I press the make "<type>" chese button
  Then  I should see the "<message>" message
    Examples:
      |type|message|
      |swiss|I love Swiss cheese|
      |Blue |I love Blue cheese |
      |Cheddar|I love Cheddar cheese|


