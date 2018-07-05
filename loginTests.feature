Feature: Validate Login scenarios

  Scenario: Validate placeholders or hint text for email address and password fields
    Given I am on the login page
    Then the email address and password fields must have valid hint text


  Scenario: Validate visibility of form controls on login page
    Given I am on the login page
    Then Email address field should be available
    And Password field should be available
    And Login button should be available

  Scenario:Validate if control is on email address field by default
    Given I am on the login page
    Then cursor focus should be on email address field by default

  Scenario: Validate if user is able to login with valid credentials
    Given I am on the login page
    And I enter a valid email address
    And I enter a valid password
    And I click the login button
    Then I should be redirected to the homepage

  Scenario: Validate if user is able to switch between form controls using tab key
    Given I am on the login page
    Then cursor focus should be on email address field by default
    And I enter a valid email address
    And I press the tab key on email address field
    Then The control should be on password field
    And I enter a valid email address
    And I press the tab key on password field
    Then The control should be on sign in button

  Scenario: Validate if user is able to login using return or enter key
    Given I am on the login page
    And I enter a valid email address
    And I enter a valid password
    And I press return or enter key on keyboard
    Then I should be redirected to the homepage

  Scenario Outline: Validate invalid login scenarios
    Given I am on the login page
    And I enter <emailAddress> in the email address field
    And I enter <password> in the password field
    And I click the login button
    Then I must see an invalid login error

    Examples:
    |emailAddress        | password           |
    |valid@email.com     |invalidPassword     |
    |invalid@email.com   |validPassword       |
    |                    |validPassword       |
    |valid@email.com     |                    |
    |                    |                    |
    |invalid@email.com   |                    |
    |                    |invalidPassword     |

  Scenario: Validate paste option does not work for password field
    Given I am on the login page
    And I paste clipboard text to password field
    Then clipboard text should not be pasted in the password field

  Scenario: Validate copy option does not work for password field
    Given I am on the login page
    And I enter some text in the password field
    And I try copying text in the password field
    Then text in password field should not be copied to the clipboard

  Scenario: Validate if CAPTCHA is displayed after 5 unsuccessful login attempts
    Given I am on the login page
    And I enter an invalid username and password 5 times
    Then A CAPTCHA should be displayed on the login form

  Scenario: Validate user is directed to forgot password page when he/she clicks forgot password link
    Given I am on the login page
    And I click the forgot password link
    Then I should be directed to the forgot password page
    
  Scenario: Validate if user is direct to account creation page when he/she clicks Create New Account or SignUp button
    Given I am on the login page
    And I click on the Create New Account button
    Then I should be directed to the create new account page