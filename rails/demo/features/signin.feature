Feature: Signin
As an authorized user
I want to login

  Scenario: User login into system successfully
    Given an User "admin" exists with password "test@123" 
    And I am not logged in
    When I visit the home page
		When I fill in "Username" with "admin" 
		And I fill in "Password" with "test@123" 
		And I press "Login"
		Then I should be on the home page

	Scenario: User login into system unsuccessfully
		Given an User "admin" exists with password "test@123"
		And I am not logged in
    When I visit the home page
		When I fill in "Username" with "admin" 
		And I fill in "Password" with "test@12345" 
		And I press "Login"
		Then I should be on the home page
		And I see message "Username or Password is not correct" 