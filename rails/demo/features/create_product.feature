Feature: Create product
As an authorized user
I want to create a product

	Background: 
		Given an User "user001" exists with password "test@123" 
		And I am logged in
		When I visit the myproduct page
		And I press "Create Your Product" button

	Scenario: Create a product succesfully

		And I fill in:
		|Title			|Nike Black T-lite Xi Sl Training Sports Shoes|
		|Price 			|38$|
		|Description|A pair of round-toed|
		And I upload the image
		And I press "Create Product" button
		Then I see message "Create successful" 

	Scenario: Create a product unsuccesfully
		When I fill in:
		|Title			||
		|Price 			|38$|
		|Description|A pair of round-toed|
		And I upload the image
		And I press "Create Product" button
		Then I see message "Please fill in 'Title' field" 

	Scenario: Create a product unsuccesfully
		When I fill in:
		|Title			|Nike Black T-lite Xi Sl Training Sports Shoes|
		|Price 			||
		|Description|A pair of round-toed|
		And I upload the image
		And I press "Create Product" button
		Then I see message "Please fill in 'Price' field" 	