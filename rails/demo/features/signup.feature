Feature: Sign up
As an unauthorized user
I want to signup with my details
So that I can login
	
	Scenario: User register an account on system
		Given I am on the signup page
		When I fill in "textbox" with "value":
		|textbox|value|
		|First Name|David|
		|Last Name|James|
		|Email|davidJame@gmail.com|
		|Password|test@123|
		|Password Confirmation|test@123|
		And I press "Signup" button
		Then I see message "Account 'DavidJames' is created successfully"

  