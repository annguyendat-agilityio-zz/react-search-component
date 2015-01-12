Feature: Sign up
As an unauthorized user
I want to signup with my details
So that I can login
	Background:
		Given I visit the signup page
	Scenario: User register an account on system succesfully
		When I fill in:
		|First Name							|David|
		|Last Name							|James|
		|Email									|davidJame@gmail.com|
		|Password								|test@123|
		|Password Confirmation	|test@123|
		And I press "Signup" button
		Then I see message "Account 'DavidJames' is created successfully"

  Scenario: User register an account on system unsuccesfully
		When I fill in:
		|First Name							|David|
		|Last Name							|James|
		|Email									|davidJame|
		|Password								|test@123|
		|Password Confirmation	|test@123|
		And I press "Signup" button
		Then I see message "Email is not correct"

	Scenario: User register an account on system unsuccesfully
		When I fill in:
		|First Name							|David|
		|Last Name							|James|
		|Email									|davidJame@gmail.com|
		|Password								|test@123|
		|Password Confirmation	|test@12345|
		And I press "Signup" button
		Then I see message "Password don't match"