Feature: Like a product
As an authorized user
I want to like a product

	Scenario: Like a product
		Given an User "user001" exists with password "test@123" 
		And a product with: 
		|title			|Nike Black T-lite Xi Sl Training Sports Shoes|
		|price 			|$38|
		|description|A pair of round-toed|
		And I am logged in
		When I visit the productdetail page
		And I press "Like" button
		Then I see total like is increase