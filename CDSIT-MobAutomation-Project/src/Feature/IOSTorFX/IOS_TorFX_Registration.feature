@TorFX_Registration
Feature: To test the registration functionality

  @TorFX_PID-3854_TC01 @TorRegLot1
  Scenario: 1.1 , 2.2 To verify that when user click on create your account button onboarding screen then user navigates to about you screen and on click of back option user navigate back to onboarding screen
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user clicks on back button
    Then ios app should load the onboarding screen

  @TorFX_PID-3854_TC02 @TorRegLot1
  Scenario: 1.1, 2.2  To verify that when user click on create an account on Login page user should land on about you page  and when user back option from About you screen user should land back on login page.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    And ios user click on the create an account button on login screen
    Then ios user should navigate to about you screen
    When ios user clicks on back button
    Then ios user should navigate to login screen

  @TorFX_PID-3854_TC03 @TorRegLot1
  Scenario Outline: To verify that when user enters valid data in about you fields and when focus get changes to other field then green tick should display to fields
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID             | DateOfBirth | occupation | otherOccupation    |
      | Johnas    | sams     | cfsrt@dummymail.com | 01-01-2000  | Accountant | Software Develpoer |

  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  |Administrator|Software Develpoer|
  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  |Director|Software Develpoer|
  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  |Retired|Software Develpoer|
  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  |Other|Software Develpoer|
  #This testcae is not applicable as regex data is not supported for personal details
  @TorFX_PID-3854_TC04 @TorRegLot1
  Scenario Outline: To verify that application allow user to enter supported regex in about you input data fields.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstNameWithRegEx>"
    And ios user enters the valid last name "<LastNameWithRegEx>"
    And ios user enters the valid email id "<EmailIDWithRegEx>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app

    Examples: 
      | FirstNameWithRegEx       | LastNameWithRegEx       | EmailIDWithRegEx               | DateOfBirth | occupation    | otherOccupation |
      | ^[.A-Z0C0\\-]+$FirstName | ^[.A-Z0C0\\-]+$LastName | ^[.A-Z0C0\\-]+$email@dummy.com | 01-01-1984  | Administrator | ^[.A-Z0C0\\-]+$ |

  @TorFX_PID-3854_TC05 @TorRegLot1
  Scenario Outline: To verify that application allow user to enter max data in about you input data fields.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the max length first name "<FirstName>"
    And ios user enters the max length last name "<LastName>"
    And ios user enters the max length email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app

    Examples: 
      | FirstName              | LastName              | EmailID              | DateOfBirth | occupation    | otherOccupation                                          |
      | FirstNameWithMaxlength | LastNameWithMaxlength | EmailIDWithMaxLength | 01-01-1956  | Administrator | HJGHJGSJHGSGHJGSHGSHGHJSGHJGSJHGSJHGSJHGSJHGSHJGSHSGHJSG |

  @TorFX_PID-3854_TC06 @TorRegLot1
  Scenario Outline: To verify that application display error message when user enters the invalid data with unsupported regex in about you input data fields.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the invalid first name "<inValidFirstName>"
    Then invalid first name error message should be displayed in ios app
    When ios user enters the invalid last name "<invalidLastName>"
    Then invalid last name error message should be displayed in ios app
    When ios user enters the invalid email id "<inValidEmailID>"
    Then invalid email id error message should be displayed in ios app
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then invalid other occupation error message should be displayed in ios app
    And continue button should be in disabled state in ios app

    Examples: 
      | inValidFirstName      | invalidLastName       | inValidEmailID                  | occupation | otherOccupation    |
      | ^(?=.*[a-zA-Z0-9]).+$ | ^(?=.*[a-zA-Z0-9]).+$ | ^(?=.*[a-zA-Z0-9]).+$@gmail.com | Other      | ^(?=.*[a-zA-Z0-9]) |

  @TorFX_PID-3854_TC07 @Torfx_iOS_regression @TorRegLot1
  Scenario Outline: To verify that application display mandatory field error message when user doesnot enters or removes data from the about you input data fields.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user removes the valid first name
    Then mandatory first name error message should be displayed
    When ios user enters the valid last name "<LastName>"
    And ios user removes the valid last name
    Then mandatory last name error message should be displayed
    When ios user enters the valid email id "<EmailID>"
    And ios user removes the valid email id
    Then mandatory email id error message should be displayed
    When ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    And ios user removes the valid other occupation
    Then mandatory other information error message should be displayed

    Examples: 
      | FirstName | LastName | EmailID              | occupation | otherOccupation    |
      | John      | Sweven1  | jhvd67@dummymail.com | Other      | Software Developer |

  @TorFX_PID-3854_TC08 @TorRegLot1
  Scenario Outline: To verify that continue button should be enabled when user enters valid data in all input data fields available on about you screen
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID            | DateOfBirth | occupation | otherOccupation    |
      | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | Other      | Software Developer |

  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  |Administrator|NA|
  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  |Director|NA|
  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  |Retired|NA|
  #Email id already exist error message not yet developed
  @TorFX_PID-3854_TC09 @Torfx_iOS_regression @TorRegLot1
  Scenario Outline: To verify the error message when user enters already existed email address in registration
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then email id already exist error message should be displayed to ios user

    Examples: 
      | FirstName | LastName | EmailID              | DateOfBirth | occupation | otherOccupation    |
      | John      | Sweven   | prst5@mailinator.com | 01-01-2000  | Other      | Software Developer |

  @TorFX_PID-3854_TC10 @TorRegLot1
  Scenario Outline: 2.6 User should land on address page when user click on Continue button on About you page with default country as UK
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    And UK should be a default country in ios app current address screen

    Examples: 
      | FirstName | LastName | EmailID            | DateOfBirth | occupation | otherOccupation    |
      | swens     | petrs    | opje@dummymail.com | 01-01-2000  | Other      | Software Developer |

  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | Administrator | NA                 |
  #Error code not defined
  @TorFX_PID-3854_TC11 @TorRegLot1
  Scenario Outline: 2.8 To verify that continue button should remain disabled and displays mandatory first name error message when user does not provide or provide invalid  first name
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    And ios user removes the valid first name
    Then mandatory first name error message should be displayed
    Then continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID            | DateOfBirth | occupation | otherOccupation    |
      | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | Other      | Software Developer |

  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | Administrator | NA                 |
  #Error code not defined
  @TorFX_PID-3854_TC12 @TorRegLot1
  Scenario Outline: 2.8 To verify that continue button should remain disabled and displays mandatory last name error message when user doesnot provide last name
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    And ios user removes the valid last name
    Then mandatory last name error message should be displayed
    And continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID            | DateOfBirth | occupation | otherOccupation    |
      | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | Other      | Software Developer |

  #| John      | Sweven   | abcd@dummymail.com | 01-01-2000  | Administrator | NA                 |
  #Error code not defined
  @TorFX_PID-3854_TC13 @TorRegLot1
  Scenario Outline: 2.8 To verify that continue button should remain disabled and displays mandatory email id error message when user doesnot provide email id
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    And ios user removes the valid email id
    Then mandatory email id error message should be displayed
    Then continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID            | DateOfBirth | occupation | otherOccupation    |
      | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | Other      | Software Developer |

  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | Administrator | NA                 |
  #Error code not defined
  @TorFX_PID-3854_TC14 @TorRegLot1
  Scenario Outline: 2.8 To verify that continue button should remain disabled and mandatory other information error message when user doesnot provide  other occupation
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    And ios user removes the valid other occupation
    Then mandatory other information error message should be displayed
    Then continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID            | DateOfBirth | occupation | otherOccupation    |
      | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | Other      | Software Developer |

  @TorFX_PID-3854_TC15 @Torfx_iOS_regression @TorRegLot1
  Scenario Outline: 3.2,3.3  To verify that when user presses back button then the user is taken to about you screen loaded with the details previously entered by the user and able to proceed with newly updated details
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    And ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user clicks on back button
    Then ios user should navigate to about you screen
    Then the about you screen should load with the details previously entered by the user
    Then ios user should navigate to about you screen
    When ios user updates the valid first name "<newFirstName>"
    And ios user updates the valid last name "<newLastName>"
    And ios user updates the valid email id "<newEmailID>"
    And ios user updates the valid date of birth "<newDateOfBirth>"
    And ios user selects the occupation "<newOccupation>" and updates other occupation "<newOtherOccupation>" if required
    And ios user click on continue button
    Then ios user should navigate to current address screen

    Examples: 
      | FirstName | LastName | EmailID              | DateOfBirth | occupation    | otherOccupation | newFirstName | newLastName | newEmailID          | newDateOfBirth | newOccupation | newOtherOccupation |
      # | John      | Sweven   | abcd@dummymail.com   | 01-01-2000  | Other         | Software Developer | Adam         | Smith       | asmith@dummymail.com | 02-05-2000     | Administrator | NA                 |
      | Bryanv    | Smitht   | oljg32@dummymail.com | 02-05-2000  | Administrator | NA              | hsd          | saofs       | opgt5@dummymail.com | 01-01-2000     | Other         | Software Developer |

  @TorFX_PID-3854_TC16 @TorRegLot2
  Scenario Outline: 3.6 To verify that when the user enters a country name then the country list should be filtered with matching options
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app

    Examples: 
      | FirstName | LastName | EmailID            | DateOfBirth | country | occupation | otherOccupation    |
      | John      | Sweven   | abcp@dummymail.com | 01-01-2000  | UK      | Other      | Software Developer |

  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  |      44 | Administrator | NA                 |
  @TorFX_PID-3854_TC17 @TorRegLot2
  Scenario Outline: 3.7 To verify enter search data gets cleared when user selects (x) option and the whole country list should be displayed
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user click on (X) option
    Then the filter should be cleared and the whole country list should be displayed on ios screen

    Examples: 
      | FirstName | LastName | EmailID             | DateOfBirth | country                  | occupation    | otherOccupation |
      #| John      | Sweven   | abcd@dummymail.com | 01-01-2000  | USA     | Other         | Software Developer |
      | John      | Sweven   | abcde@dummymail.com | 01-01-2000  | United States Of America | Administrator | NA              |

  @TorFX_PID-3854_TC18 @TorRegLot2
  Scenario Outline: 3.8 To verify that when user selects a country then the app should take the user back to current address screen with the selected country
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    And selected country "<country>" should be displayed in country dropdown of ios app

    Examples: 
      | FirstName | LastName | EmailID             | DateOfBirth | country | occupation | otherOccupation |
      #| John      | Sweven   | abcd@dummymail.com | 01-01-2000  | USA     | Other      | Software Developer |
      | John      | Sweven   | abcdf@dummymail.com | 01-01-2000  | France  | Accountant | NA              |

  @TorFX_PID-3854_TC19 @TorRegLot2
  Scenario Outline: 3.10 To verify that when user search for a country and user presses back button without selecting country then the user is taken to the Current Address screen
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    And ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    #When ios user clicks on the back button
    When ios user clicks on back button
    Then ios user should navigate to current address screen

    Examples: 
      | FirstName | LastName | EmailID              | DateOfBirth | country | occupation | otherOccupation |
      #| John      | Sweven   | abcd1@dummymail.com | 01-01-2000  | USA     | Other      | Software Developer |
      | John      | Sweven   | abcd24@dummymail.com | 01-01-2000  | France  | Accountant | NA              |

  @TorFX_PID-3854_TC20 @TorRegLot2
  Scenario Outline: 3.11 To verify that when user clicks on search address field then address search screen should be displayed
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen

    Examples: 
      | FirstName | LastName | EmailID              | DateOfBirth | country | occupation | otherOccupation |
      #| John      | Sweven   | abcd3@dummymail.com | 01-01-2000  | USA     | Other      | Software Developer |
      | John      | Sweven   | abcd45@dummymail.com | 01-01-2000  | France  | Accountant | NA              |

  @TorFX_PID-3854_TC21 @TorRegLot2
  Scenario Outline: 3.12, 3.13 To verify that when use enters some text in address search bar then app should fetch matching address options and filter the list according to the selected country
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country

    Examples: 
      | FirstName | LastName | EmailID               | DateOfBirth | country | occupation | otherOccupation    | address |
      | John      | Sweven   | abcd567@dummymail.com | 01-01-2000  | France  | Other      | Software Developer | abc     |

  @TorFX_PID-3854_TC22 @TorRegLot2
  Scenario Outline: 3.14 To verify that when searched address not available then application displays Nothing found message with enter address manually link
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should display nothing found message with enter address manually link

    Examples: 
      | FirstName | LastName | EmailID                | DateOfBirth | country | occupation | otherOccupation    | address |
      | John      | Sweven   | abcd6789@dummymail.com | 01-01-2000  | France  | Other      | Software Developer | @&      |

  @TorFX_PID-3854_TC23 @TorRegLot2
  Scenario Outline: 3.15 To verify that when user clicks the close icon in the search address field then address filter should be cleared
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user click on (X) option
    Then the filter should be cleared and empty search address screen should be displayed

    Examples: 
      | FirstName | LastName | EmailID               | DateOfBirth | country | occupation | otherOccupation    | address |
      | John      | Sweven   | abcd789@dummymail.com | 01-01-2000  | France  | Other      | Software Developer | xyz     |

  @TorFX_PID-3854_TC24 @TorRegLot2
  Scenario Outline: 3.16 To verify that when user selects an address from the list,then the app should take the user back to Current address screen with selected address populated in those updated address form fields
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app

    Examples: 
      | FirstName | LastName | EmailID               | DateOfBirth | country | occupation | otherOccupation    | address |
      | John      | Sweven   | abcd910@dummymail.com | 01-01-2000  | France  | Other      | Software Developer |     123 |

  @TorFX_PID-3854_TC25 @TorRegLot2
  Scenario Outline: 3.17 To verify that when user presses back button without selecting address on address search screen then user should taken to Current Address screen
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user clicks on back button available on search address screen
    Then ios user should navigate to current address screen

    Examples: 
      | FirstName | LastName | EmailID                 | DateOfBirth | country | occupation | otherOccupation | address |
      | John      | Sweven   | abcd10112@dummymail.com | 01-01-2000  | France  | Director   | NA              | abc     |

  @TorFX_PID_3855_TC26 @TorRegLot2
  Scenario Outline: 3.19 To verify that after entering the address details manually ,fields should be validated as per Regex validation rules
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<Address>" field data
    Then continue button should be in enabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID                 | DateOfBirth | country | occupation | otherOccupation | Address   |
      #  | John      | Sweven   | abcd13@dispostable.com | 01-01-2000  | United Kingdom      | Other      | Architect Eng   | UKAdd   |
      #   | Peter     | Sweven   | abcd2@dispostable.com  | 11-01-1990  | United States | Director   | NA              | USAAdd    |
      #   | Steve     | Sweven   | abcd3@dispostable.com  | 21-10-1985  | United States | Director   | NA              | AUSAdd    |
      # | John      | Sweven   | abcd4@dispostable.com  | 22-02-1996  | Spain         | Director   | NA              | SpainAdd  |
      #   | Mike      | Sweven   | abcd5@dispostable.com  | 18-08-1998  | Canada        | Director   | NA              | CanadaAdd |
      | Neil      | Sweven   | abcd678@dispostable.com | 16-04-1986  | France  | Director   | NA              | FranceAdd |

  @TorFX_PID-3855_TC27 @TorRegLot2
  Scenario Outline: 3.20 To verify that when user is on current address screen and all the mandatory address fields value enter by the user then continue button should be enabled
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<Address>" field data
    Then continue button should be in enabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID                  | DateOfBirth | country | occupation | otherOccupation | Address   |
      | John      | Sweven   | abcd1314@dispostable.com | 01-01-2000  | France  | Other      | Architect Eng   | FranceAdd |

  #  | Peter     | Sweven   | abcd2@dispostable.com  | 11-01-1990  | United States | Director   | NA              | USAAdd    |
  #  | Steve     | Sweven   | abcd3@dispostable.com  | 21-10-1985  | United States | Director   | NA              | AUSAdd    |
  #  | John      | Sweven   | abcd4@dispostable.com  | 22-02-1996  | Spain         | Director   | NA              | SpainAdd  |
  #  | Mike      | Sweven   | abcd5@dispostable.com  | 18-08-1998  | Canada        | Director   | NA              | CanadaAdd |
  #  | Neil      | Sweven   | abcd6@dispostable.com  | 16-04-1986  | France        | Director   | NA              | FranceAdd |
  @TorFX_PID-3855_TC28 @TorRegLot2
  Scenario Outline: 3.21 To verify current address screen with mandatory address field error messages continue button is in disabled state for UK,France,Spain,India country.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<Address>" field data
    Then continue button should be in enabled state in ios app
    When ios user removes mandatory address field address line
    Then street line field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app
    When ios user removes mandatory address field town city
    Then town city field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app
    When ios user removes mandatory address field post code
    Then post code field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID                   | DateOfBirth | country | occupation | otherOccupation | Address   |
      | John      | Sweven   | abcd13156@dispostable.com | 01-01-2000  | France  | Other      | Architect Eng   | FranceAdd |

  #  | John      | Sweven   | abcd4@dispostable.com  | 22-02-1996  | Spain         | Director   | NA              | SpainAdd  |
  #  | Neil      | Sweven   | abcd6@dispostable.com  | 16-04-1986  | France        | Director   | NA              | FranceAdd |
  #Note - Mandatory field
  #Group1 : UK-France-Spain-India: AddressLine1,City,PostCode
  #The Test case is not applicable as Country USA is not supported for signup
  @TorFX_PID-3855_TC29 @TorRegLot2
  Scenario Outline: 3.21 To verify current address screen with mandatory address field error messages and continue button is in disabled state for USA country.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<Address>" field data
    Then continue button should be in enabled state in ios app
    And ios user removes mandatory address field unit street apartment
    Then unit street apartment field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app
    When ios user removes mandatory address field city
    Then city field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app
    When ios user removes mandatory address field zip code
    Then zip code field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID                  | DateOfBirth | country   | occupation | otherOccupation | Address |
      | Steve     | Sweven   | abcd3789@dispostable.com | 21-10-1985  | Australia | Director   | NA              | AUSAdd  |

  #Note - Mandatory field
  #Group2: USA : StreetLine1,City,State,ZipCode
  @TorFX_PID-3855_TC30 @TorRegLot2
  Scenario Outline: 3.21 To verify current address screen with mandatory address field error messages continue button is in disabled state for Australia country.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<Address>" field data
    Then continue button should be in enabled state in ios app
    And ios user removes mandatory address field street name
    Then street name field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app
    When ios user removes mandatory address field street number
    Then street number field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app
    When ios user removes mandatory address field suburb
    Then suburb field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app
    When ios user removes mandatory address field post code of australia country
    Then post code field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID                  | DateOfBirth | country   | occupation | otherOccupation | Address |
      | Steve     | Sweven   | abcd3367@dispostable.com | 21-10-1985  | Australia | Director   | NA              | AUSAdd  |

  #Note - Mandatory field
  #Group3: Australia: StreetNumber,StreetName,StreetType,Suburb,State,PostCode
  #The Test case is not applicable as Country Canada is not supported for signup
  @TorFX_PID-3855_TC31
  Scenario Outline: 3.21 To verify current address screen with mandatory address field error messages continue button is in disabled state for Canada country.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<Address>" field data
    Then continue button should be in enabled state in ios app
    And ios user removes mandatory address field street name
    Then street name field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app
    When ios user removes mandatory address field city of canada country
    Then city field required error message should be displayed in ios app
    And continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID                  | DateOfBirth | country | occupation | otherOccupation | Address   |
      | Mike      | Sweven   | abcd5670@dispostable.com | 18-08-1998  | Canada  | Director   | NA              | CanadaAdd |

  #Note - Mandatory field
  #Group4: Australia: StreetNumber,StreetName,StreetType,Suburb,State,PostCode
  @TorFX_PID-3857_TC32 @TorRegLot3
  Scenario Outline: To verify that when user submits all the valid data and clicking on continue button on current address screen ios user should navigate to mobile number screen
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen

    Examples: 
      | FirstName | LastName | EmailID                | DateOfBirth | country | occupation | otherOccupation | address |
      | John      | Sweven   | abcd13hk@dummymail.com | 01-01-2000  | France  | Director   | NA              |   33500 |

  @TorFX_PID-3857_TC33 @TorRegLot3
  Scenario Outline: To verify that when user lands to Your mobile number screen then Country Code selector field should be set by default with country of residence provided on current address
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    And country "<country>" should be pre selected as per current address in ios app

    Examples: 
      | FirstName | LastName | EmailID               | DateOfBirth | country | occupation | otherOccupation | address |
      | John      | Sweven   | abcdoy5@dummymail.com | 01-01-2000  | France  | Director   | NA              |   33500 |

  @TorFX_PID-3857_TC34 @TorRegLot3
  Scenario Outline: 5.6 To verify that when country code selection list is displayed and user enters
    a country code or name then the country list should be filtered with matching options

    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app

    Examples: 
      | FirstName | LastName | EmailID                 | DateOfBirth | country | countryCode | occupation | otherOccupation | address |
      | John      | Sweven   | abcdeg456@dummymail.com | 01-01-2000  | France  | +91         | Director   | NA              |   33500 |

  # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | American samoa | +91         | Director   | NA              | abc     |
  @TorFX_PID-3857_TC35 @TorRegLot3
  Scenario Outline: To verify that when country code selection list is displayed and user enters a country name
        which does not exist in country code list then country code not found error screen should be displayed on mobile number screen

    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<InvalidCountry>" on mobile number screen
    Then no match found message should be displayed in ios app on mobile number screen

    Examples: 
      | FirstName | LastName | EmailID               | DateOfBirth | country | occupation | otherOccupation | address | InvalidCountry |
      | kebins    | news1    | hbjnb87@dummymail.com | 01-01-2000  | France  | Director   | NA              |   33500 | @&             |

  #  | John      | Sweven   | abcd@dummymail.com | 01-01-2000  |      44 | Director   | NA              | abc     | XYZ            |
  #The Test case is not applicable as Country American samoa is not supported
  @TorFX_PID-3857_TC36 @TorRegLot3
  Scenario Outline: 5.7 To verify that when user is searching for a country code and user clicks
    the close icon in the search field then the filter should be cleared and the whole list should be displayed

    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<country>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user click on clear search option
    Then the filter should be cleared and the whole country list should be displayed on ios screen

    Examples: 
      | FirstName | LastName | EmailID                  | DateOfBirth | country | occupation | otherOccupation | address | countryName | countryCode |
      # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | France      | Director   | NA              | abc     | American samoa |          44 |
      | John      | Sweven   | abcdefgt67@dummymail.com | 01-01-2000  | France  | Director   | NA              |   33500 | Spain       |          44 |

  @TorFX_PID-3857_TC37 @TorRegLot3
  Scenario Outline: 5.8 To verify that when user selects searched country then country and  country code gets updated in field value
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<country>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>" on mobile number screen
    Then selected country "<country>" should be displayed in mobile number screen of ios app

    Examples: 
      | FirstName | LastName | EmailID               | DateOfBirth | country | occupation | otherOccupation | address | countryName |
      # | John      | Sweven   | abcd@dummymail.com | 01-01-2000  | France      | Director   | NA              | abc     | American samoa |
      | John      | Sweven   | abcddg4@dummymail.com | 01-01-2000  | France  | Director   | NA              |   33500 | Spain       |

  @TorFX_PID-3857_TC38 @TorRegLot3
  Scenario Outline: 5.9 To verify that when user is searching for a country code and user presses back button
    or device back button then the user is taken to Your mobile number screen

    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<country>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    #And ios user clicks on the back button
    When ios user clicks on back button
    Then ios user should navigate to mobile number screen

    Examples: 
      | FirstName | LastName | EmailID                 | DateOfBirth | country | occupation | otherOccupation | address | countryName | countryCode |
      | John      | Sweven   | abcdegy75@dummymail.com | 01-01-2000  | France  | Director   | NA              |   33500 | Spain       |          44 |

  @TorFX_PID-3857_39 @TorRegLot3
  Scenario Outline: To verify the error message to be display when user enters the min or max digit in mobile number field
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<country>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>" on mobile number screen
    Then selected country "<country>" should be displayed in mobile number screen of ios app
    When ios user enters mobile number "<minMobileNumber>"
    Then continue button should be in disabled state in ios app
    #When ios user click on continue button
    #Then invalid mobile number error message should be displayed to ios user
    When ios user enters mobile number "<maxMobileNumber>"
    Then continue button should be in enabled state in ios app

    # When ios user click on continue button
    # Then invalid mobile number error message should be displayed to ios user
    Examples: 
      | FirstName | LastName | EmailID                | DateOfBirth | country | occupation | otherOccupation | address | minMobileNumber | maxMobileNumber |
      | John      | Sweven   | abcdsg67@dummymail.com | 01-01-2000  | France  | Director   | NA              |   33500 |              86 |      8788836324 |

  @TorFX_PID-3857_40 @TorRegLot3
  Scenario Outline: 5.13 To verify that when user enter valid details on mobile number screen and clicks on continue then user should navigate to enter OTP screen
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<country2>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country2>" on mobile number screen
    Then selected country "<country2>" should be displayed in mobile number screen of ios app
    When ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user

    Examples: 
      | FirstName | LastName | EmailID                  | DateOfBirth | country | occupation | otherOccupation | address | country2 | mobileNumber |
      | Johnsens  | Swevenht | abcdfd6575@dummymail.com | 01-01-2000  | France  | Director   | NA              |   33500 | India    |   8788836324 |

  @TorFX_PID-3858_41 @TorRegLot4 @TorFX_iOS_2FA
  Scenario Outline: 6.2 To verify when user submits the correct OTP then user navigates to the create Password screen
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    #When ios user enters valid otp "<EmailID>" to registration
    When ios user enters default otp on Registration screen
    Then ios user should navigate to set password screen

    Examples: 
      | FirstName | LastName     | EmailID                      | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  |
      | J??kess    | W????dwardkens | jakes_uat867@dispostable.com | 12-03-1987  | France  | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |

  @TorFX_PID-3858_42 @Torfx_iOS_regression @TorRegLot4
  Scenario Outline: To verify when user submits the wrong OTP then system should generate error message to provide correct OTP
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    When ios user enters invalid otp "<otp>"
    Then invalid otp error message should be displayed

    Examples: 
      | FirstName | LastName | EmailID                   | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  | otp   |
      | obsf24    | bhdvt4   | pjkkh7645@dispostable.com | 12-03-1987  | France  | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 | 12345 |

  @TorFX_PID-3858_43 @Torfx_iOS_regression @TorRegLot4
  Scenario Outline: To verify resend pin link gets displayed after sixty seconds of interval and gets disappeared when user click on resend pin link.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    When ios user do not enters otp in sixty seconds
    Then resend pin link gets displayed on ios app pin screen
    When ios user click on resend pin
    Then request a new pin timer should be start for sixty seconds in ios app

    Examples: 
      | FirstName | LastName | EmailID                      | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  |
      | emmaswr   | ojgfd2   | oioojug75654@dispostable.com | 12-03-1987  | France  | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |

  @TorFX_PID-3858_44 @TorRegLot4
  Scenario Outline: To verify when user has enetred the mobile on which PIN can not be send in that system should display user proper error message.
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<inValidMobileNumber>"
    And ios user click on continue button
    Then invalid mobile number error message should be displayed to ios user

    Examples: 
      | FirstName | LastName | EmailID                           | DateOfBirth | country | occupation | otherOccupation | address | countryCode | inValidMobileNumber | environment | password  |
      | Peters    | Jackebs  | jakebse_uatios534@dispostable.com | 12-03-1987  | France  | Director   | NA              |   33500 | +91         |                9697 | UAT         | Welcome12 |

  @TorFX_PID-3858_45 @TorRegLot4
  Scenario Outline: 6.1 To verify when user presses back button on 'Enter OTP' page then the user is taken to Your Mobile Number screen with the previously supplied details remaining on the form
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<country2>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country2>" on mobile number screen
    And ios user enters mobile number "<MobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    When ios user clicks on back button
    Then ios user should navigate to mobile number screen
    And previously enter mobile number "<MobileNumber>" and selected country "<country>" should be displayed

    Examples: 
      | FirstName | LastName | EmailID                          | DateOfBirth | country | occupation | otherOccupation | address | country2 | MobileNumber | environment | password  |
      | Peterser  | Jackbnf  | jakeed_uatiosg09@dispostable.com | 12-03-1987  | India   | Director   | NA              |     335 | +91      |   8788836324 | UAT         | Welcome12 |

  @TorFX_PID-3856_46 @TorRegLot4
  Scenario Outline: 4.3 To verify Additional information screen with the option 'Medicare,Passport,Drivers Licence' for australia country
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<address>" field data
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to additional information screen
    And medicare option should be displayed on additional information screen to ios user
    And passport option should be displayed on additional information screen to ios user
    And driving license details option should be displayed on additional information screen to ios user

    Examples: 
      | FirstName | LastName | EmailID                      | DateOfBirth | country   | occupation | otherOccupation | address | MobileNumber | environment | password  |
      | Peter     | Jack     | jake_uatio33@dispostable.com | 12-03-1987  | Australia | Director   | NA              | AUSAdd  |   8788836324 | UAT         | Welcome12 |

  @TorFX_PID-3856_47 @TorRegLot4
  Scenario Outline: 4.4,4.6,4.7,4.12 To verify Additional information screen with the 'National ID Number' option and continue button in disabled state when user dones not provided mandatory data
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then national id number option should be displayed on additional information screen to ios user
    When ios user enters national id number "<nationalID>"
    Then continue button should be in enabled state in ios app
    When ios user removes the national id number
    Then continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID                      | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  | nationalID |
      | J??ke      | W????dward | jake_uatiof5@dispostable.com | 12-03-1987  | Spain   | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |   12345678 |

  #Not developed yet
  @TorFX_PID-3856_51
  Scenario Outline: 4.6  4.12 : To verify that when user select  the additional information as "Passport" and enters required field data then continue button gets enabled and after submition of  details user
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<address>" field data
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to additional information screen
    #And passport option should be displayed on additional information screen to ios user
    #When ios user enters passport number "<passportNo>"
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen

    Examples: 
      | FirstName | LastName | EmailID                    | DateOfBirth | country   | occupation | otherOccupation | address | PassportNo | MobileNumber | environment | password  |
      | Peter     | Jack     | jake_sit25@dispostable.com | 12-03-1987  | Australia | Director   | NA              | AUSAdd  | 1234567890 |   8788836324 | UAT         | Welcome12 |

  @TorFX_PID-3856_52 @TorRegLot5
  Scenario Outline: 4.7 To verify that when user select the additional information as Medicare and removes the medicare number then continue button should be in disabled state
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<address>" field data
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to additional information screen
    And medicare option should be displayed on additional information screen to ios user
    When ios user selects medicare option
    When ios user enters medicare number "<medicareNo>"
    And ios user enters medicare reference "<medicareReference>"
    Then continue button should be in enabled state in ios app
    When ios user removes the medicare number
    Then continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName | EmailID                          | DateOfBirth | country   | occupation | otherOccupation | address | medicareNo | medicareReference | MobileNumber | environment | password  |
      | gfg       | ghggg    | jake_hjjvd87t676@dispostable.com | 12-03-1987  | Australia | Director   | NA              | AUSAdd  | 1234567890 |              2345 |   8788836324 | UAT         | Welcome12 |

  @TorFX_PID-3856_53 @TorRegLot5
  Scenario Outline: 4.7 To verify Additional information screen with the 'National ID Number' edit box and continue button in disabled state when user removes provided mandatory data
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then national id number option should be displayed on additional information screen to ios user
    When ios user enters national id number "<nationalID>"
    Then continue button should be in enabled state in ios app
    When ios user removes the national id number
    Then continue button should be in disabled state in ios app

    Examples: 
      | FirstName | LastName  | EmailID                       | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  | nationalID |
      | J??ke1     | W????dward2 | jake_uatios54@dispostable.com | 12-03-1987  | Spain   | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |   12345678 |

  @TorFX_PID-3856_54 @TorRegLot5
  Scenario Outline: 4.8 To verify that when user presses back button from the additional information screen then the user should navigate to the Step 2 - Current Address screen with the details previously stored by the application
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    When ios user click on continue button
    Then national id number option should be displayed on additional information screen to ios user
    When ios user enters national id number "<nationalID>"
    And ios user clicks on back button
    Then ios user should navigate to current address screen

    Examples: 
      | FirstName | LastName  | EmailID                      | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  | nationalID |
      | J??ke0     | W????dward3 | jake_uat7415@dispostable.com | 12-03-1987  | Spain   | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |   12345678 |

  @TorFX_PID-3856_55 @TorRegLot5
  Scenario Outline: 4.9 : To verify that when user press back button from the Medicare ,Passport,Driver's
    licence screen then user should be navigate to additional information screen and verify that when user presses back button or device back button from the additional information screen then the user ishould navigate
     to the Step 2 - Current Address screen with the details previously stored by the application

    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<address>" field data
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to additional information screen
    And medicare option should be displayed on additional information screen to ios user
    When ios user selects medicare option
    When ios user enters medicare number "<medicareNo>"
    And ios user enters medicare reference "<medicareReference>"
    Then continue button should be in enabled state in ios app
    And ios user clicks on back button
    And medicare option should be displayed on additional information screen to ios user
    And ios user clicks on back button
    Then ios user should navigate to current address screen

    Examples: 
      | FirstName | LastName | EmailID                      | DateOfBirth | country   | occupation | otherOccupation | address | medicareNo | medicareReference | MobileNumber | environment | password  |
      | Peter     | Jack     | jakse_uatt25@dispostable.com | 12-03-1987  | Australia | Director   | NA              | AUSAdd  | 1234567890 |              7565 |   8788836324 | UAT         | Welcome12 |

  @TorFX_PID-3856_56 @TorRegLot5
  Scenario Outline: 5.2 To verify that when user is on Your mobile number and user has previously provided Additional information and presses back button
    then additional information screen should be displayed with stored information

    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    When ios user click on continue button
    Then national id number option should be displayed on additional information screen to ios user
    When ios user enters national id number "<nationalID>"
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user clicks on back button
    Then previously enter national id details should be displayed on additional information screen to ios user

    Examples: 
      | FirstName | LastName  | EmailID                        | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  | nationalID |
      | J??ke1     | W????dward2 | jake_uat080f15@dispostable.com | 12-03-1987  | Spain   | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |   12345678 |

  @TorFX_PID-3856_57 @TorRegLot5
  Scenario Outline: 5.3 To verify that when user is on Your mobile number and user was NOT previously asked to provide additional information and presses back button
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user clicks on back button
    Then ios user should navigate to current address screen

    Examples: 
      | FirstName | LastName  | EmailID                         | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  |
      | J??ke1     | W????dward0 | jake_uatois7515@dispostable.com | 12-03-1987  | France  | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |

  #Note : Due to Terms and condition xpath issue this TC is not applicable
  @TorFX_PID-3856_58 @TorFX_iOS_2FA
  Scenario Outline: 7.2 To verify the all parameters of set Password screen when user landed on set password screen
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    # When ios user enters valid otp "<EmailID>" to registration
    When ios user enters default otp on Registration screen
    Then ios user should navigate to set password screen
    And all paramters of set password screen should be displayed to ios user

    Examples: 
      | FirstName | LastName | EmailID                       | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  |
      | Andrew    | Thompson | jake_uat97820@dispostable.com | 12-03-1987  | France  | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |

  @TorFX_PID-3856_59 @TorRegLot5 @TorFX_iOS_2FA
  Scenario Outline: 7.11,7.12 To verify that continue button when user selects the T&Cs acknowledgment switch
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    #When ios user enters valid otp "<EmailID>" to registration
    When ios user enters default otp on Registration screen
    Then ios user should navigate to set password screen
    When ios user enters password "<password>"
    And ios user accepts terms and condition
    Then continue button should be in enabled state in ios app

    Examples: 
      | FirstName | LastName  | EmailID                           | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  |
      | Andrew1   | Thompson3 | jakte_uatiosf5420@dispostable.com | 12-03-1987  | France  | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |

  @TorFX_PID-3856_60 @TorRegLot5 @TorFX_iOS_2FA
  Scenario Outline: To verify that continue button remains disabled when user do not enters Password or accepts T&Cs
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    # When ios user enters valid otp "<EmailID>" to registration
    When ios user enters default otp on Registration screen
    Then ios user should navigate to set password screen
    When ios user enters password "<password>"
    And ios user accepts terms and condition
    Then continue button should be in enabled state in ios app on set password screen
    When ios user removes password
    Then continue button should be in disabled state in ios app on set password screen
    When ios user enters password "<password>"
    Then continue button should be in enabled state in ios app on set password screen
    And ios user do not accepts terms and condition
    Then continue button should be in disabled state in ios app on set password screen

    Examples: 
      | FirstName | LastName  | EmailID                         | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  |
      | andrws    | Thompson1 | jake_uatios5t20@dispostable.com | 12-03-1987  | France  | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |

  #Driving license changes are pending related to xpath
  #Success screen code is pending due to continuous KYC loader is observed on app
  @TorFX_PID-3856_61 @Torfx_iOS_regression @TorRegLot5
  Scenario Outline: 8.2 To verify success page for STP user
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<address>" field data
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    And medicare option should be displayed on additional information screen to ios user
    When ios user enters medicare number "<medicareNo>"
    And ios user enters medicare reference "<medicareReference>"
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    #When ios user enters valid otp "<EmailID>" to registration
    When ios user enters default otp on Registration screen
    Then ios user should navigate to set password screen
    When ios user enters password "<password>"
    And ios user accepts terms and condition
    And ios user click on continue button
    Then ios user should navigate to registration success screen

    Examples: 
      #| FirstName | LastName | EmailID                    | DateOfBirth | country     | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  | drivingLicense |
      # | Peter      | Thompson | peter_100@dispostable.com | 12-03-1987  | Australia | Director   | NA              | AUSAdd  | +91         |   8149461195 | UAT         | Welcome12 |       12345678 |
      | FirstName | LastName | EmailID                   | DateOfBirth | country   | occupation | otherOccupation | address | medicareNo | mobileNumber | environment | password  | countryCode | medicareReference |
      | hd86      | jhg8     | oksjh8765@dispostable.com | 12-03-1987  | Australia | Director   | NA              | AUSAdd  | 1234567890 |   8788836324 | UAT         | Welcome12 | +91         |               645 |

  @TorFX_PID-3859_4 @Torfx_iOS_sanity @TorRegLot5 @TorFX_iOS_2FA
  Scenario Outline: 7.14 To verify that user land on kyc screen
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    #When ios user enters valid otp "<EmailID>" to registration
    When ios user enters default otp on Registration screen
    Then ios user should navigate to set password screen
    When ios user enters password "<password>"
    And ios user accepts terms and condition
    And ios user click on continue button
    Then ios user should navigate to kyc check screen

    Examples: 
      | FirstName | LastName | EmailID                   | DateOfBirth | country        | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  |
      | cnbvj56 | gh5    | martio8967@dispostable.com | 11-03-1987  | United Kingdom | Director   | NA              |   33500 | +91         |   8149461195 | UAT         | Welcome12 |

  #| harshiss  | watsonsde | bcjdh8757@dispostable.com | 11-03-1987  | France | Director   | NA              |   33500 | +91         |   8149461195 | UAT         | Welcome12 |
  #| harshiss  | watsonsde | svhsg675@dispostable.com | 11-03-1987  | India | Director   | NA              |   xyz | +91         |   8149461195 | UAT         | Welcome12 |
  #| harshiss  | watsonsde | kbhj786@dispostable.com | 11-03-1987  | China | Director   | NA              |   xyz | +91         |   8149461195 | UAT         | Welcome12 |
  #| harshiss  | watsonsde | okbnsd785@dispostable.com | 11-03-1987  | Singapore | Director   | NA              | xy      | +91         |   8149461195 | UAT         | Welcome12 |
  #| harshiss  | watsonsde | bdj876@dispostable.com | 11-03-1987  | South Africa | Director   | NA              |   33500 | +91         |   8149461195 | UAT         | Welcome12 |
  #| J??ke      | W????dward | jhbvhj8967@dispostable.com | 12-03-1987  | New Zealand | Director   | NA              | abc  | +91         |   8788836324 | UAT         | Welcome12 |
  @TorFX_PID-3859_465 @TorFX_iOS_2FA
  Scenario Outline: 7.14 To verify that user land on kyc screen for Singapore country
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    When ios user click on continue button
    Then national registration id card option should be displayed on additional information screen to ios user
    When ios user enters national registration id card number "<NRICNumber>"
    And ios user selects nationality "<Nationality>"
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    #When ios user enters valid otp "<EmailID>" to registration
    When ios user enters default otp on Registration screen
    Then ios user should navigate to set password screen
    When ios user enters password "<password>"
    And ios user accepts terms and condition
    And ios user click on continue button
    Then ios user should navigate to kyc check screen

    Examples: 
      | FirstName | LastName  | EmailID                   | DateOfBirth | country   | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  | NRICNumber | Nationality |
      | harshiss  | watsonsde | okbnsd785@dispostable.com | 11-03-1987  | Singapore | Director   | NA              | xy      | +91         |   8149461195 | UAT         | Welcome12 |      12535 | Benin       |

  @TorFX_PID-3856_49 @CDRegLot5 @TorFX_iOS_2FA
  Scenario Outline: 4.6  4.12 : To verify that when user select  the additional information as National ID Number
            and enters required field data then continue buttongets enabled and after submition of  details user redirects to mobile number screen

    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user click on search address
    Then ios user should navigate to search address screen
    When ios user searches for address "<address>"
    Then ios app should fetch matching address according to the selected country
    When ios user select searched address
    Then ios user should navigate to current address screen
    And selected address should be updated in address field of ios app
    When ios user click on continue button
    Then national id number option should be displayed on additional information screen to ios user
    When ios user enters national id number "<nationalID>"
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    #When ios user enters valid otp "<EmailID>" to registration
    When ios user enters default otp on Registration screen
    Then ios user should navigate to set password screen
    When ios user enters password "<password>"
    And ios user accepts terms and condition
    And ios user click on continue button
    Then ios user should navigate to kyc check screen

    Examples: 
      | FirstName | LastName | EmailID                 | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  | nationalID |
      | J??ke      | W????dward | bsjdh45@dispostable.com | 12-03-1987  | Spain   | Director   | NA              |   33500 | +91         |   8788836324 | UAT         | Welcome12 |   12345678 |

  @TorFX_PID-3856_50 @TorFX_iOS_2FA
  Scenario Outline: 4.5, 4.6,4.12 To verify that when user select the additional information as Medicare and enters required field data then continue buttongets enabled and after submition of  details user redirects to mobile number screen
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    #When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    #When ios user selects the country from searched result list "<country>"
    When ios user selects country "<country>"
    Then ios user should navigate to current address screen
    When ios user click on enter address manually link
    And ios user enters country specific required address "<address>" field data
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to additional information screen
    And medicare option should be displayed on additional information screen to ios user
    When ios user enters medicare number "<medicareNo>"
    And ios user enters medicare reference "<medicareReference>"
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    #When ios user enters valid otp "<EmailID>" to registration
    When ios user enters default otp on Registration screen
    Then ios user should navigate to set password screen
    When ios user enters password "<password>"
    And ios user accepts terms and condition
    And ios user click on continue button
    Then ios user should navigate to kyc check screen

    Examples: 
      | FirstName | LastName | EmailID                    | DateOfBirth | country   | occupation | otherOccupation | address | medicareNo | mobileNumber | environment | password  | countryCode |
      | Peter     | Jack     | jbcfjb7566@dispostable.com | 12-03-1987  | Australia | Director   | NA              | AUSAdd  | 1234567890 |   8788836324 | UAT         | Welcome12 | India       |

  @TorFX_PID-3856_48 @TorFX_iOS_2FA
  Scenario Outline: 4.3 To verify Additional information screen with the option 'Drivers Licence' for New Zealand country
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<country>"
    Then ios user should navigate to current address screen
    When ios user selects country "<country>"
    When ios user click on enter address manually link
    And ios user enters country specific required address "<address>" field data
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    # And driving license details option should be displayed on additional information screen to ios user
    # When ios user enters driving license details "<drivingLicense>"
    # Then continue button should be in enabled state in ios app
    # When ios user click on continue button
    Then ios user should navigate to mobile number screen
    When ios user selects country drop down and enters country code or name "<countryCode>" on mobile number screen
    Then matching country should be displayed in search result of ios app
    When ios user selects the country from searched result list "<countryCode>" on mobile number screen
    And ios user enters mobile number "<mobileNumber>"
    And ios user click on continue button
    Then otp page should be displayed to ios user
    #When ios user enters valid otp "<EmailID>" to registration
    When ios user enters default otp on Registration screen
    Then ios user should navigate to set password screen
    When ios user enters password "<password>"
    And ios user accepts terms and condition
    And ios user click on continue button
    Then ios user should navigate to kyc check screen

    Examples: 
      | FirstName | LastName | EmailID                 | DateOfBirth | country     | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  | drivingLicense |
      | J??ke      | W????dward | bj87567@dispostable.com | 12-03-1987  | New Zealand | Director   | NA              | NZDAdd  | +91         |   8788836324 | UAT         | Welcome12 |       12345678 |

  @TorFX_PID-3859_50
  Scenario Outline: To verify that Canada and USA country should not be supported for registration flow
    Given ios user installed the new TorFX app and launched successfully
    Then ios app should load the onboarding screen
    When ios user click on I already have an account? link
    Then ios user should navigate to login screen
    When ios user click on the create an account button on onboarding screen
    Then ios user should navigate to about you screen
    When ios user enters the valid first name "<FirstName>"
    And ios user enters the valid last name "<LastName>"
    And ios user enters the valid email id "<EmailID>"
    And ios user enters the valid date of birth "<DateOfBirth>"
    And ios user selects the occupation "<occupation>" and enters other occupation "<otherOccupation>" if required
    Then continue button should be in enabled state in ios app
    When ios user click on continue button
    Then ios user should navigate to current address screen
    When ios user selects country drop down and enters country code or name "<country>"
    Then matching country should not be displayed in search result of ios app

    Examples: 
      | FirstName | LastName  | EmailID                  | DateOfBirth | country | occupation | otherOccupation | address | countryCode | mobileNumber | environment | password  |
      | harshiss  | watsonsde | jkgh6756@dispostable.com | 11-03-1987  | Canada  | Director   | NA              |   33500 | +91         |   8149461195 | UAT         | Welcome12 |
      | harshiss  | watsonsde | jkgh6756@dispostable.com | 11-03-1987  | USA     | Director   | NA              |   33500 | +91         |   8149461195 | UAT         | Welcome12 |
