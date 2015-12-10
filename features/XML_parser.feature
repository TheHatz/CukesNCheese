Feature: using XML in my cukes!

  Scenario: find the number of sitcoms and dramas
    When  I open my shows xml file
    Then  I should see 2 sitcoms
    And   I should see 1 drama

  Scenario: retrieve phone book info from an XML file I create
    Given I create XML for these phone book entries:
      |name|phone|
      |George|123-1212|
      |Joe   |321-2121|
      |Jim   |135-1331|
      |John  |111-2233|
    When I look up the entry for "John"
    Then I see the phone number "111-2233"