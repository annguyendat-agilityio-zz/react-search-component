Feature: Signin
As an authorized user
I want to login
	
	Background: 
		Given an User "admin" exists with password "test@123" 
    And I am not logged in
    When I visit the home page

  Scenario: User login into system successfully
		When I fill in:
		|Username		|admin|
		|Password 	|test@12345|
		And I press "Login" button
		Then I should be on the home page

	Scenario: User login into system unsuccessfully
		When I fill in: 
		|Username		|admin|
		|Password 	|test@12345|
		And I press "Login" button
		Then I should be on the home page
		And I see message "Username or Password is not correct" 