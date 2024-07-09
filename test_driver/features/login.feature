Feature: Login
    As a user
    I want to login
    So that I can access my account

    Scenario: login with valid credentials
#        Given user is on the login screen
        When user logs in with username "admin" and password "admin"
#        Then user should be redirected to the dashboard screen

#    Scenario: login with invalid credentials
#        Given user is on the login screen
#        When user tries to log in with username "admin" and password "admin"
#        Then user should see the error message "Invalid credentials"