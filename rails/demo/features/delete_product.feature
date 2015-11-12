Feature: Delete product
As an authorized user
I want to delete a product

	Scenario: Create a product succesfully
		Given an User "user001" exists with password "test@123" 
		And a product with: 
		|title			|Nike Black T-lite Xi Sl Training Sports Shoes|
		|price 			|$38|
		|description|A pair of round-toed|
		And I am logged in
		When I visit the myproduct page
		And I press "Delete" button
		And I press "Yes" button
		Then I see message "Delete successful" 