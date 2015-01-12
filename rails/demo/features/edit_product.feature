Feature: Edit product
As an authorized user
I want to edit a product
	Background: 
		Given an User "user001" exists with password "test@123" 
		And a product with: 
		|title			|Nike Black T-lite Xi Sl Training Sports Shoes|
		|price 			|$38|
		|description|A pair of round-toed|
		And I am logged in
		When I visit the myproduct page
		And I press "Edit" button
		
	Scenario: Edit a product succesfully
		
		When I fill in:
		|Title			|Nike Black T-lite Xi Sl|
		|Price 			|$49|
		|Description|A pair|
		And I press "Edit Product" button
		Then I see the exists product with:
		|title			|Nike Black T-lite Xi Sl|
		|price 			|$49|
		|description|A pair|

	Scenario: Edit a product unsuccesfully
		
		When I fill in:
		|Title			||
		|Price 			|$49|
		|Description|A pair|
		And I press "Edit Product" button
		Then I see message "Please fill in 'Title' field"