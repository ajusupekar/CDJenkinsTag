@LoginLaunch @Login
Feature: To test Login functionality :

  Background:
    Given android user installed the new CD app and launched successfully
    When android the version is supported by the server
    And android scheduled maintenance has been checked
    Then android the app should load the onboarding screen
    When android user click on I already have an account? link
    Then android user should navigate to login screen

  @PAD-2487 @PAD-2487_TC19  @login
  Scenario Outline: 5.2 5.4 To verify that login button should be enabled when user enters the valid email id and password
    When android user is logged into the app with Username "<emailAddress>" and Password "<password>"
    Then android user should be land on send money screen

    Examples:
      | emailAddress     | password       |
      | CDWalletListUser | CDRegEmailPass |

  @PAD-2487 @PAD-2487_TC20  @login
  Scenario: 5.3 To verify that login buttion is inactive when user doesnot provide the username and Password
    When android the user doest not provides Username and Password
    Then android login button remains inactive to submit the credentials

  @PAD-2487 @PAD-2487_TC21  @login
  Scenario Outline: 5.3.1 To verify that when user  provides only username then login button should remain disabled.
    When android user  provide only Username "<emailAddress>"
    Then android login button remains inactive to submit the credentials

    Examples:
      | emailAddress |
      | CDRegEmailId |

  @PAD-2487 @PAD-2487_TC23  @login
  Scenario Outline: 5.3.2 To verify that when user  provide only password then login button should remain inactive
    When android user  provide only Password "<password>"
    Then android login button remains inactive to submit the credentials

    Examples:
      | password       |
      | CDRegEmailPass |

  @PAD-2487 @PAD-2487_TC24  @login
  Scenario Outline: 5.6 To Verify that if user exits the Login process and relaunch the app then it redirects to onboarding page.
    When android the user provides Username "<emailAddress>" and Password "<password>"
    When android pinned user relaunches the application
    Then android the app should load the onboarding screen

    Examples:
      | emailAddress | password       |
      | CDWalletList | CDRegEmailPass |

  @PAD-2487 @PAD-2487_TC25  @login
  Scenario Outline: 5.5 To verify that when user performs login with valid user credetials then system stores the data for future subsequent logins.
    When android the user provides Username "<emailAddress>" and Password "<password>"
    Then android login button should be active to submit the credentials
    When android user click on the login button and credentials authentication is successful
    Then android the app should load the dashboard screen
    And android user required data should be saved in secure device storage for future subsequent logins

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2487 @PAD-2487_TC26  @login
  Scenario Outline: 5.6 To Verify that if user exits the Login process and relaunch the app then it redirects to onboarding page.
    When android the user provides Username "<emailAddress>" and Password "<password>"
    Then android login button should be active to submit the credentials
    When android user click on the login button and credentials authentication is successful
    Then android the app should load the dashboard screen

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2487 @PAD-2487_TC27  @login
  Scenario Outline: 5.8 To verify validation error message for invalid email id format.
    When android user  provide Username "<emailAddress>" in invalid format field
    Then android a validation failure message should be displayed for the username

    Examples:
      | emailAddress  |
      | CDRegEmailId5 |

  @PAD-2721 @PAD-2486_TC28  @ForgotPassword
  Scenario: 5.9 Verify that when user clicks on the Forgot Password link then user redirects to forgot password process screen.
    And android forgot password? link should present on login screen
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen

  @PAD-2721 @PAD-2721_TC29  @ForgotPassword
  Scenario Outline: 7.1 To verify that forgot password button should be in active state , when user enters valid registered user email id.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provide valid registered Username "<emailAddress>"
    Then android forgot password button should be active

    Examples:
      | emailAddress |
      | CDRegEmailId |

  @PAD-2721 @PAD-2721_TC30  @ForgotPassword
  Scenario Outline: 7.3 To verify that forgot password button remains disabled and email validation error message gets populated, when user provides email id in invalidformat.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user  provide Username "<emailAddress>" in invalid format in forgotemail field
    And android forgot password button should be inactive

    Examples:
      | emailAddress  |
      | CDRegEmailId7 |

  @PAD-2721 @PAD-2721_TC31  @ForgotPassword
  Scenario: 7.4 To verify that forgot password button remains inactive when user doesnot provide the username .
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user  doesnot provide Username
    Then android forgot password button should be inactive

  @PAD-2721 @PAD-2721_TC32  @ForgotPassword
  Scenario Outline: 7.5 To check that reset password link has been sent success message gets displayed when user submit the valid registered user email id.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provide valid registered Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed

    Examples:
      | emailAddress |
      | CDRegEmailId |

  @PAD-2721 @PAD-2721_TC33  @ForgotPassword
  Scenario Outline: 7.5 To check that reset password link has been sent success message gets displayed when user submit the valid registered user email id.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provide valid registered Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed
    When android user closes the reset password link success window
    Then android user should navigate to login screen

    Examples:
      | emailAddress |
      | CDRegEmailId |

  @PAD-2721_TC34  @ForgotPassword
  Scenario Outline: 7.5.1 To check that failure message gets displayed on forgot password screen when user submit the non registered user email id.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provide valid non registered Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset passwod failure message should be displayed

    Examples:
      | emailAddress       |
      | Nonregisteraccount |

  @PAD-2721 @PAD-2721_TC35  @ForgotPassword
  Scenario: To check that when user closes the forgot password window then user lands on the login page.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user close the forgot password window
    Then android user should navigate to login screen

  @PAD-2721 @PAD-2721_TC36  @ForgotPassword
  Scenario: To check the label description on the forgot password screen.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    And android forgot password description label should be present on screen

  @PAD-2721 @PAD-2721_TC37  @login
  Scenario Outline: To verify that when user enters the invalid Username and Password then system displays invalid credentials error message.
    When android the user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    Then authentication unsuccessful error message should be displayed on login screen for android user

    Examples:
      | emailAddress  | password        |
      | CDRegEmailId5 | CDRegEmailPass1 |

  @PAD-2488 @PAD-2679 @PAD-2488_TC38  @biometric @login
  Scenario Outline: 6.1_6.2 Verify when register user logged into the app previously then after relaunching the app it should display with user name pre-filled
    When android the user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android biometric credentials have been enabled for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android app should request the users biometric credentials to login

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC39  @biometric @login
  Scenario Outline: 6.3  Verify when register user logged into the app previously then after relaunching the app it should display option to enter password.
    When android the user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    And android app should not request for the biometric credentials to login

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC40  @biometric @login
  Scenario Outline: 6.4 Verify when register user logged into the app previously then after relaunching the app it should display option to show/hide the password
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    And android app should not request for the biometric credentials to login
    When android user begins to type in the password "<password>" field
    Then android an eye icon to show/hide the password value should be available

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId  | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC41  @biometric @login
  Scenario Outline: 6.5 Verify when register user logged into the app previously then after relaunching the app it should not display option to show/hide the password
    When android the user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android password field is blank
    Then an eye icon to show hide the password value should not be available for android app

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC42  @biometric @login
  Scenario Outline: 6.5 Verify when register user the data in password field and clears that again then option to show/hide the
    password data should not display

    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user enters data in the password field and clear the entered data
    Then an eye icon to show hide the password value should not be available for android app

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC43  @login
  Scenario Outline: 6.6 Verify when user enters the value in password field it should be masked
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user begins to type in the password "<password>" field
    Then android value in the password field should be masked

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC44  @biometric @login
  Scenario Outline: To verify show hide password functionality on pinned user login screen.
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user begins to type in the password "<password>" field
    Then android value in the password field should be masked
    When android user click on eye icon to unmask the password value
    Then password value should be unmasked for android user
    When android user click on eye icon to mask the password value
    Then password value should be masked for android user
    When android user click on the login button
    Then android app should load the dashboard screen

    Examples:
      | emailAddress | password       |
      | CDWalletList | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC45  @biometric @login
  Scenario Outline: 6.3 To verify that biometric request popup do not get display on pinned user login screen when biometric option have not been enabled by user
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    And android app should not request for the biometric credentials to login
    When android user allow to type in the password "<password>" field

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC46  @biometric @login
  Scenario Outline: 6.9_6.13._6.15 To verify that system allow user perform login journey when user cancel the biometric authentication popup
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android biometric credentials have been enabled for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android app should request the users biometric credentials to login
    When android user cancel the biometric option
    When android user begins to type in the password "<password>" field
    Then android option to login button is made active
    When android user click on the login button and credentials authentication is successful
    Then android the app should load the dashboard page

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC47  @biometric @login
  Scenario Outline: 6.11 To verify that app replace the an option of biometric credentials with an option to show/hide the password value
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android biometric credentials have been enabled for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android app should request the users biometric credentials to login
    When android user cancel the biometric option
    When android user provides Password "<password>"
    Then android option to login button is made active
    Then android an eye icon to show/hide the password value should be available

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC48  @biometric @login
  Scenario Outline: 6.12 To verify that app replace an option to show/hide the password value with option of biometric credentials after clear the text
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user provides Password "<password>"
    Then android an eye icon to show/hide the password value should be available
    When android user clear the password field value
    Then an eye icon to show hide the password value should not be available for android app

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC49  @biometric @login
  Scenario Outline: 6.14 To verify that when user does not provide password then login button should remain disabled.
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android biometric credentials have been enabled for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android app should request the users biometric credentials to login
    When android user cancel the biometric option
    When android user has NOT entered the password
    Then android option to submit the credential is disabled

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC50  @biometric @login
  Scenario Outline: 6.16 To verify that when pinned user reinstall the application then user lands on dashboard screen.
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user selects the option to login as a different user and clear the data
    Then android user should navigate to login screen
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android biometric credentials have been enabled for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android app should request the users biometric credentials to login
    When android pinned user reset the application
    Then android the app should load the onboarding screen

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC51  @ForgotPassword
  Scenario Outline: 6.17 To verify forgot password process screen
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android biometric credentials have been enabled for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android app should request the users biometric credentials to login
    When android user cancel the biometric option
    When android user click on forgot password? link
    Then android forgot password process should be triggered

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC52  @ForgotPassword
  Scenario Outline: 5.9, 6.17 Verify when user select forgot password journey then it should redirect to respective page
    When android the user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    Then android the app should load the dashboard screen
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android option to forgot password is selected
    Then android forgot password process should be triggered

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId  | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC53  @biometric @login
  Scenario Outline: 6.18 To verify that if biometric is enabled then it should display in account section as enabled
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android biometric credentials have been enabled for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android app should request the users biometric credentials to login
    When android user cancel the biometric option
    When android user provides Password "<password>"
    When android user click on the login button and credentials authentication is successful
    Then android the app should load the dashboard page
    And android user tap on account menu
    Then android user verify biometric switch is enabled in account section

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId  | CDRegEmailPass |

  @PAD-2488 @PAD-2679 @PAD-2488_TC54  @biometric @login
  Scenario Outline: 6.19 To verify that if biometric is skip then it should display in account section as enabled
    When android existing user provides  Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user provides Password "<password>"
    When android user click on the login button and credentials authentication is successful
    And android user tap on account menu
    Then android user verify biometric switch is disabled in account section

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId  | CDRegEmailPass |

  @PAD-2488 @PAD-2488_TC60  @ForgotPassword
  Scenario Outline: 7.5 To check that reset password link has been sent success message gets displayed when user submit the valid registered user email id.
    When android the user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    Then android the app should load the dashboard screen
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provide valid registered Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2488 @PAD-2488_TC61  @ForgotPassword
  Scenario Outline: 7.5 To check that reset password link has been sent success message gets displayed when user submit the valid registered user email id.
    When android the user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    Then android the app should load the dashboard screen
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provide valid registered Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed
    When android user closes the reset password link success window
    Then android user should navigate to login screen

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2494 @PAD-2494_TC63  @login
  Scenario Outline: To verify after entering the  Security questions and answers user then 'Submit' button gets active
    When android the new registered user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user provided security questions and answer
    Then android option to submit their details should be active

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId6 | CDRegEmailPass |

  @PAD-2494 @PAD-2494_TC62  @login
  Scenario Outline: To verify after entering the valid Security questions and answers user should able to proceed further
    When android existing registered user provides Username "<emailAddress>" and Password "<password>"
    When android user set their Security questions and answers
    Then the app should continue to the next process

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId6 | CDRegEmailPass |

  #Login with another user accoutn : option has been removed
  @PAD-2494 @PAD-2494_TC64  @login
  Scenario Outline: To verify if user skip the security questions and answer then after relauching the app user should asked to set security questions and answer
    When android the new registered user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user set only first security questions and answer
    When android pinned user relaunches the application
    Then android user tap on login with another user account present on subsequent login page
    And android the new registered user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    Then android user should get the option to set their Security questions and answers

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId9 | CDRegEmailPass |

  @PAD-2494 @PAD-2494_TC65  @login
  Scenario Outline: To verify if user skip the security questions and answer then after relauching the app user should asked to set security questions and answer
    When android the new registered user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user set only first security questions and answer
    When android pinned user relaunches the application
    When android user provides Password "<password>"
    When android user click on the login button and credentials authentication is successful
    Then android user should get the option to set their Security questions and answers

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId9 | CDRegEmailPass |

  @PAD-2494 @PAD-2494_TC66  @login
  Scenario Outline: To verify if user skip the security questions and answer then after relauching the app user should asked to set security questions and answer
    When android the new registered user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user set their Security questions and answers
    Then the app should continue to the next process
    When android pinned user relaunches the application
    When android user provides Password "<password>"
    When android user click on the login button and credentials authentication is successful
    Then android user should not get the option to set their Security questions and answers

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId9 | CDRegEmailPass |

  @PAD-2494 @PAD-2494_TC67  @login
  Scenario Outline: To verify that if user enters sets only first security questions and answer then submit button is i
    When android the new registered user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user set only first security questions and answer
    Then android the option to submit their details should be inactive

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId9 | CDRegEmailPass |

  @PAD-2494 @PAD-2494_TC68  @login
  Scenario Outline: 12.4 To verify submit button is disabled when user provides security question and answer in invalid format
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    Then android user should get the option to set their Security questions and answers
    When android user provides their Security QAs in  invalid format
    Then android the option to submit their details should be inactive

    Examples:
      | emailAddress  | password       |
      | CDRegEmailId9 | CDRegEmailPass |

  @PAD-2491 @PAD-2491_TC69  @login
  Scenario Outline: To verify that system allow user with warning popup message for invalid attempt
    When user provides Username "<emailAddress>" which has legal entity is "<LegalEntity>"
    When android user enters invalid password for 1 time
    Then android user displays related information for the 1 attempt
    When android user enters invalid password for 2 time
    Then android user displays related information for the 2 attempt
    When android user enters invalid password for 3 time
    Then android user displays related information for the 3 attempt
    When android user enters invalid password for 4 time
    Then android user displays related information for the 4 attempt
    When android user enters invalid password for 5 time
    Then android user displays related information for the 5 attempt

    Examples:
      | emailAddress   | LegalEntity |
      | CDRegEmailId10 | LGB         |

  @PAD-2491 @PAD-2491_TC70  @biometric @login
  Scenario Outline: To verify that system allow user with warning popup message for invalid attempt
    When user provides Username "<emailAddress>" which has legal entity is "<LegalEntity>"
    When android user provides valid password field
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user enters invalid password for 1 time
    Then android user displays related information for the 1 attempt
    When android user enters invalid password for 2 time
    Then android user displays related information for the 2 attempt
    When android user enters invalid password for 3 time
    Then android user displays related information for the 3 attempt

    Examples:
      | emailAddress   | LegalEntity |
      | CDRegEmailId15 | LGB         |

  @PAD-2491 @PAD-2491_TC71  @biometric @login
  Scenario Outline: To verify that system allow user with warning popup message for invalid attempt
    When user provides Username "<emailAddress>" which has legal entity is "<LegalEntity>"
    When android user provides valid password field
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user enters invalid password for 1 time
    Then android user displays related information for the 1 attempt
    When android user enters invalid password for 2 time
    Then android user displays related information for the 2 attempt
    When android user enters invalid password for 3 time
    Then android user displays related information for the 3 attempt
    When user provides Username which has legal entity is "<LegalEntity>"
    When android user enters invalid password for 4 time
    Then android user displays related information for the 4 attempt
    When android user enters invalid password for 5 time
    Then android user displays related information for the 5 attempt

    Examples:
      | emailAddress   | LegalEntity |
      | CDRegEmailId11 | LGB         |

  @PAD-2491 @PAD-2491_TC72  @login
  Scenario Outline: To verify that system allow user with warning popup message for invalid attempt
    When user provides Username "<emailAddress>" which has legal entity is "<LegalEntity>"
    When android user enters invalid password for 1 time
    Then android user displays related information for the 1 attempt
    When android user enters invalid password for 2 time
    Then android user displays related information for the 2 attempt
    When android user enters invalid password for 3 time
    Then android user displays related information for the 3 attempt
    When android user enters invalid password for 4 time
    Then android user displays related information for the 4 attempt
    When android user provides valid Password field
    When android user skip the biometric credentials for the app
    Then android the app should display the dashboard screen

    Examples:
      | emailAddress   | LegalEntity |
      | CDRegEmailId12 | LGB         |

  @PAD-2491 @PAD-2491_TC73  @login
  Scenario Outline: To verify that system allow user with warning popup message for invalid attempt
    When user provides Username "<emailAddress>" which has legal entity is "<LegalEntity>"
    When android user enters invalid password for 1 time
    Then android user displays related information for the 1 attempt
    When android user enters invalid password for 2 time
    Then android user displays related information for the 2 attempt
    When android user enters invalid password for 3 time
    Then android user displays related information for the 3 attempt
    When android user provides valid Password field
    When android user skip the biometric credentials for the app
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user enters invalid password for 1 time
    Then android user displays related information for the 1 attempt
    When android user enters invalid password for 2 time
    Then android user displays related information for the 2 attempt

    Examples:
      | emailAddress  | LegalEntity |
      | CDRegEmailId4 | LGB         |

  @PAD-2491 @PAD-2491_TC74
  Scenario Outline: To verify that system allow user with warning popup message for invalid attempt
    When user provides Username "<emailAddress>" which has legal entity is "<LegalEntity>"
    When android user provides valid password field
    When android user skip the biometric credentials for the app
    Then android the app should load the dashboard page
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user enters invalid password for 1 time
    Then android user displays related information for the 1 attempt
    When android user enters invalid password for 2 time
    Then android user displays related information for the 2 attempt
    When android user enters invalid password for 3 time
    Then android user displays related information for the 3 attempt
    When android user provides valid Password field
    Then android the app should display the dashboard screen

    Examples:
      | emailAddress   | LegalEntity |
      | CDRegEmailId4  | LGB         |

  @PAD-3207 @PAD-3207_TC76  @ForgotPassword
  Scenario Outline: 7.5 To check that reset password link has been sent success message gets displayed when locked user account submit the valid registered user email id.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android inactive account user provide valid registered Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed

    Examples:
      | emailAddress  |
      | CDRegEmailId4 |

  @PAD-3207 @PAD-3207_TC75  @ForgotPassword
  Scenario Outline: 7.5 To check that reset password link has been sent success message gets displayed whrn Valid user provided
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android locked account user provide valid registered Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed

    Examples:
      | emailAddress  |
      | CDRegEmailId4 |

  @PAD-3207 @PAD-3207_TC77  @ForgotPassword
  Scenario Outline: 7.5 To check that reset password link has been sent success message gets displayed when locked user account submit the valid registered user email id.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provides non existing Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed

    Examples:
      | emailAddress  |
      | CDRegEmailId4 |

  @PAD-3207 @PAD-3207_TC72  @ForgotPassword
  Scenario Outline: To verify success message gets displayed on forgot password screen when user submit active user email id.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provide valid registered Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed

    Examples:
      | emailAddress |
      | CDRegEmailId |

  @PAD-2519 @PAD-2519_TC78  @biometric @login
  Scenario Outline: 15.8 To verify the setup biometric functionality switch status is off in account setting.
    When android the user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android user skip the biometric credentials for the app
    And android user tap on account menu
    Then android user verify biometric switch is disabled in account section

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-2519 @PAD-2519_TC79  @biometric @login
  Scenario Outline: 15.8 To verify the setup biometric functionality switch status is off in account setting.
    When android the user provides Username "<emailAddress>" and Password "<password>"
    And android user click on the login button and credentials authentication is successful
    When android biometric credentials have been enabled for the app
    And android user tap on account menu
    Then android user verify biometric switch is enabled in account section

    Examples:
      | emailAddress | password       |
      | CDRegEmailId | CDRegEmailPass |

  @PAD-3207 @PAD-3207_TC80  @biometric @ForgotPassword
  Scenario Outline: To verify success message gets displayed on forgot password screen when user submit the locked due to inavlid attempt	user email id.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provide locked due to inavlid attempt Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed

    Examples:
      | emailAddress  |
      | CDRegEmailId3 |

  @PAD-3207 @PAD-3207_TC81  @ForgotPassword
  Scenario Outline: To verify success message gets displayed on forgot password screen when user submit the locked due to inavlid attempt	user email id.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provide admin locked Username "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed

    Examples:
      | emailAddress   |
      | CDRegEmailId   |

  @PAD-3207 @PAD-3207_TC82  @ForgotPassword
  Scenario Outline: To verify success message gets displayed on forgot password screen when user submit the locked due to inactive	user email id.
    When android user click on forgot password? link
    Then android user navigate to forgot password process screen
    When android user provide atlas inactive Username  "<emailAddress>"
    And android user click on send me a link button
    Then android reset password link has been sent success message should be displayed

    Examples:
      | emailAddress  |
      | CDRegEmailId  |

  @PAD-2493 @PAD-2493_TC84  @login
  Scenario Outline: 11.1 To verify invalid otp for existing user on full login screen
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    Then OTP page should be displayed to android user
    When android user enters invalid OTP "<OTP>"
    Then android invalid otp error message should be displayed

    Examples:
      | emailAddress  | password       | OTP               |
      | CDRegEmailId12| CDRegEmailPass | AndroidInvlaidOTP |

  @PAD-2493 @PAD-2493_TC86  @login
  Scenario Outline: To verify resend pin link gets displayed after sixty seconds of interval and gets disappeared when user click on resend pin link.
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    Then OTP page should be displayed to android user
    When android user do not enters otp in sixty seconds
    Then resend pin link gets displayed on android app pin screen
    When android user click on resend pin
    Then request a new pin timer should be start for sixty seconds

    Examples:
      | emailAddress   | password       |
      | CDRegEmailId12 | CDRegEmailPass |

  @PAD-2493 @PAD-2493_TC87  @90daysValidotp @login
  Scenario Outline: 11.1 To verify 2FA with valid otp for existing user on full login screen when Last log in is before 90 days
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    Then OTP page should be displayed to android user
    When android user enters valid otp "<emailAddress>" "<environment>"
    When OTP user skip the biometric credentials for the app
    Then OTP app should load the dashboard screen

    Examples:
      | emailAddress   | password       | otp | environment |
      | CDRegEmailId12 | CDRegEmailPass | OTP | UAT         |

  @PAD-2493 @PAD-2493_TC88  @validotp @biometric @login
  Scenario Outline: 11.2_11.3To verify QAs setup with valid otp for new user on full login screen
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    Then OTP page should be displayed to android user
    When android user enters valid otp "<emailAddress>" "<environment>"
    When android OTP user set their Security questions and answers
    When OTP user skip the biometric credentials for the app
    Then OTP app should load the dashboard screen

    Examples:
      | emailAddress   | password       | environment |
      | CDRegEmailId13 | CDRegEmailPass | UAT         |

  @PAD-2493 @PAD-2493_TC89  @login
  Scenario Outline: To verify QAs setup with valid otp for new user on subsequent login screen
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    Then OTP page should be displayed to android user
    When android pinned user relaunches the application
    Then android user is taken to the login screen with user name pre-filled
    When android user provides Password "<password>"
    And android user click on the login button
    When android user enters invalid OTP "<OTP>"
    Then android invalid otp error message should be displayed

    Examples:
      | emailAddress  | password       | otp               |
      | CDRegEmailId12 | CDRegEmailPass | AndroidInvlaidOTP |

  @PAD-3207 @PAD-3207_TC83  @LoginLaunch @netconnection
  Scenario Outline: To verify internet connection not available message on forgot password screen.
    When android user click on forgot password? link
    When android there is no internet connection
    Then android user navigate to forgot password process screen
    When android user provide valid registered Username "<emailAddress>"
    And android user click on send me a link button
    Then android information related to no internet connection should display

    Examples:
      | emailAddress |
      | CDRegEmailId |

  @PAD-3207 @PAD-3207_TC84  @LoginLaunch
  Scenario Outline: To verify 2FA with valid otp for existing user by switching between two application
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    Then OTP page should be displayed to android user
    When android user switch to other application "<appPackage>"
    And android reswitch to cdapp
    And android user enters valid otp "<emailAddress>" "<environment>"
    When OTP user skip the biometric credentials for the app
    Then OTP app should load the dashboard screen

    Examples:
      | emailAddress   | password       | otp | environment | appPackage                        |
      | CDRegEmailId12 | CDRegEmailPass | OTP | UAT         | com.google.android.apps.messaging |

  @PAD-3207 @PAD-3207_TC90  @LoginLaunch
  Scenario Outline: To verify user is able to process any journey without any disturbance after access token time period expired (currently its 10 min)
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    Then android the app should load the dashboard screen
    And android user selects the recipient option from the home dashboard
    And android user waits until access token expired for miliseconds "<miliSeconds>"
    And android user selects an option to add a new recipient
    Then add recipient screen should be displayed to android user

    Examples:
      | emailAddress | password       | miliSeconds |
      | CDRegEmailId | CDRegEmailPass |       60000 |

  @PAD-3641 @PAD-3641_TC100 @LoginLaunch
  Scenario Outline: 1,2  To verify that system ask user Uplod document page from mail login if POI flag is true
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    When android user skip the biometric credentials for the app
    Then android the app should load the ID update needed screen

    Examples:
      | emailAddress | password       |
      | CDLEUPOIUser | CDRegEmailPass |

  #update LastPinVerifiedOn date from db beofre excute below scenario
  @PAD-3641_TC101 @LoginLaunch
  Scenario Outline: To verify that poi page should ask the user even if user get login after 90 days
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    Then OTP page should be displayed to android user
    When android user enters valid otp "<emailAddress>" "<environment>"
    When android user skip the biometric credentials for the app
    Then android the app should load the ID update needed screen

    Examples:
      | emailAddress | password       | environment |
      | CDLEUPOIUser | CDRegEmailPass | UAT         |

  @PAD-3641 @PAD-3641_TC102 @LoginLaunch
  Scenario Outline: 3:To verify that System should not ask for poi document upload for the user if POI flag is off
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    Then android the app should load the dashboard screen

    Examples:
      | emailAddress | password      |
      | CDLEUPOIOff  | CDPwdCustName |

  @PAD-3641 @PAD-3641_TC103 @LoginLaunch
  Scenario Outline: 6:To verify when user click on ???Update ID??? button then users should trigger for POI upload process and user should land on web login page in mobile brower
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    When android user skip the biometric credentials for the app
    Then android the app should load the ID update needed screen
    When android user click on Update ID button
    Then android the app should navigate to web login page

    Examples:
      | emailAddress | password       |
      | CDLEUPOIUser | CDRegEmailPass |

  @PAD-3641 @PAD-3641_TC104 @LoginLaunch
  Scenario Outline: 8:To verify when user click on ???Update ID??? button then users should trigger for POI upload process and user should land on web login page in mobile brower
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    When android user skip the biometric credentials for the app
    Then android the app should load the ID update needed screen
    When android user click on Update ID button
    Then android the app should navigate to web login page
    When android user presses device back button
    Then android the app should load the ID update needed screen

    Examples:
      | emailAddress | password       |
      | CDLEUPOIUser | CDRegEmailPass |

  @PAD-3641 @PAD-3641_TC105 @LoginLaunch
  Scenario Outline: 9:To verify that user is on upload poi screen and clicking on ???Do it later??? button user should navigate to the Dashboard
    When existing user provides Username "<emailAddress>" and Password "<password>" first time for android app
    And android user click on the login button
    When android user skip the biometric credentials for the app
    Then android the app should load the ID update needed screen
    When android user click on Do it later button
    Then android app should load the dashboard screen

    Examples:
      | emailAddress | password       |
      | CDLEUPOIUser | CDRegEmailPass |

