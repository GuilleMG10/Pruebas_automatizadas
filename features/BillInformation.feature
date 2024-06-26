Feature: Bill Information Form
  As a user
  I want to fill out the Bill Information form
  So I can complete the billing and shipping details

Background:
    Given I am on the GMO homepage
    And I enter to product catalog
    And I place an order
    And I proceed with order

Scenario: Fill out Bill To information correctly
    When I fill in the Bill To section with the following details:
        | Name    | Pepe Perez    |
        | Address | 123 Main St   |
        | City    | ciudad        |
        | State   | estado        |
        | Zip     | 12345         |
        | Phone   | 555-555-5555  |
        | E-mail  | pepe@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "4111111111111111" as the Card Number
    And I enter "12/24" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then the order should be accepted

Scenario: Fill out Bill To information correctly (check phone format)
    When I fill in the Bill To section with the following details:
        | Name    | Pedro    |
        | Address | Calle    |
        | City    | nyc      |
        | State   | New York      |
        | Zip     | 30000         |
        | Phone   | 5555555555  |
        | E-mail  | pedro@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "1234567891234567" as the Card Number
    And I enter "03/25" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then the order should be accepted

Scenario: Fill out Bill To information correctly (check card number format)
    When I fill in the Bill To section with the following details:
        | Name    | Juan    |
        | Address | Micasa    |
        | City    | nyc      |
        | State   | New York      |
        | Zip     | 30000         |
        | Phone   | 555-555-5555  |
        | E-mail  | juan@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "1234-1234-1234-1234" as the Card Number
    And I enter "03/25" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then the order should be accepted

Scenario: Fill out Bill To information with incorrect card number
    When I fill in the Bill To section with the following details:
        | Name    | Juan    |
        | Address | Micasa    |
        | City    | nyc      |
        | State   | New York      |
        | Zip     | 30000         |
        | Phone   | 555-555-5555  |
        | E-mail  | juan@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "12345678910" as the Card Number
    And I enter "03/25" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "Please enter a valid card number of the form '1234-1234-1234-1234' in this field."

Scenario: Fill out Bill To information with incorrect card expiration format
    When I fill in the Bill To section with the following details:
        | Name    | Juan    |
        | Address | Micasa    |
        | City    | nyc      |
        | State   | New York      |
        | Zip     | 30000         |
        | Phone   | 555-555-5555  |
        | E-mail  | juan@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "1234567891234567" as the Card Number
    And I enter "03-25" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "Please enter a valid date of the form 'MM/YY' in this field."

Scenario: Fill out Bill To information with missing field Address
    When I fill in the Bill To section with the following details:
        | Name    | Juan    |
        | City    | nyc      |
        | State   | New York      |
        | Zip     | 30000         |
        | Phone   | 555-555-5555  |
        | E-mail  | juan@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "1234567891234567" as the Card Number
    And I enter "03/25" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "This is a required field."

Scenario: Fill out Bill To information with missing field card expiration date
    When I fill in the Bill To section with the following details:
        | Name    | Juan    |
        | Address | Micasa    |
        | City    | nyc      |
        | State   | New York      |
        | Zip     | 30000         |
        | Phone   | 555-555-5555  |
        | E-mail  | juan@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "1234567891234567" as the Card Number
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "Please enter a valid date of the form 'MM/YY' in this field."

Scenario: Fill out Bill To information without checking ship to same as bill checkbox
    When I fill in the Bill To section with the following details:
        | Name    | Juan    |
        | Address | Micasa    |
        | City    | nyc      |
        | State   | New York      |
        | Zip     | 30000         |
        | Phone   | 555-555-5555  |
        | E-mail  | juan@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "1234567891234567" as the Card Number
    And I enter "03/25" as the Expiration date
    And I click Place the Order button
    Then I should see an alert with the message "This is a required field."

Scenario: Fill out Bill To information with missing Name
    When I fill in the Bill To section with the following details:
        | Address | 123 Main St   |
        | City    | ciudad        |
        | State   | estado        |
        | Zip     | 12345         |
        | Phone   | 555-555-5555  |
        | E-mail  | pepe@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "4111111111111111" as the Card Number
    And I enter "12/24" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "This is a required field."

Scenario: Fill out Bill To information with invalid email format
    When I fill in the Bill To section with the following details:
        | Name    | Pepe Perez    |
        | Address | 123 Main St   |
        | City    | ciudad        |
        | State   | estado        |
        | Zip     | 12345         |
        | Phone   | 555-555-5555  |
        | E-mail  | pepe.example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "4111111111111111" as the Card Number
    And I enter "12/24" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "Please enter a valid email address in this field."

Scenario: Fill out Bill To information with invalid phone number format
    When I fill in the Bill To section with the following details:
        | Name    | Pepe Perez    |
        | Address | 123 Main St   |
        | City    | ciudad        |
        | State   | estado        |
        | Zip     | 12345         |
        | Phone   | 555-555-abc   |
        | E-mail  | pepe@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "4111111111111111" as the Card Number
    And I enter "12/24" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "Please enter a valid phone number in this field."

Scenario: Fill out Bill To information with missing City
    When I fill in the Bill To section with the following details:
        | Name    | Juan    |
        | Address | Micasa  |
        | State   | New York|
        | Zip     | 30000   |
        | Phone   | 555-555-5555  |
        | E-mail  | juan@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "1234567891234567" as the Card Number
    And I enter "03/25" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "This is a required field."

Scenario: Fill out Bill To information with missing State
    When I fill in the Bill To section with the following details:
        | Name    | Juan    |
        | Address | Micasa  |
        | City    | nyc     |
        | Zip     | 30000   |
        | Phone   | 555-555-5555  |
        | E-mail  | juan@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "1234567891234567" as the Card Number
    And I enter "03/25" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "This is a required field."

Scenario: Fill out Bill To information with missing Zip code
    When I fill in the Bill To section with the following details:
        | Name    | Juan    |
        | Address | Micasa  |
        | City    | nyc     |
        | State   | New York|
        | Phone   | 555-555-5555  |
        | E-mail  | juan@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "1234567891234567" as the Card Number
    And I enter "03/25" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "Please enter a valid zip code in this field."

Scenario: Fill out Bill To information with invalid Zip code
    When I fill in the Bill To section with the following details:
        | Name    | Juan    |
        | Address | Micasa  |
        | City    | nyc     |
        | State   | New York|
        | Zip     | abcde   |
        | Phone   | 555-555-5555  |
        | E-mail  | juan@example.com |
    And I select "Visa" from the Credit Card combo box
    And I enter "1234567891234567" as the Card Number
    And I enter "03/25" as the Expiration date
    And I check the Same as Bill To checkbox
    And I click Place the Order button
    Then I should see an alert with the message "Please enter a valid zip code in this field."