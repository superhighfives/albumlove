Feature: Signing in
  
  Scenario: Unsuccessful signin
    Given a user visits the signin page
    When it submits invalid signin information
    Then it should see an error message
  
  Scenario: Successful signin
    Given a user visits the signin page
      And the user has an account
      And the user submits valid signin information
    Then it should see his profile page
      And it should see a signout link