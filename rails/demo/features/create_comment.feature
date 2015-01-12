Feature: Create comment
As an authorized user
I want to post a comment

	Scenario: Create a product succesfully
		Given an User "user001" exists with password "test@123" 
		And a product with: 
		|title			|Nike Black T-lite Xi Sl Training Sports Shoes|
		|price 			|$38|
		|description|A pair of round-toed|
		And I am logged in
		When I visit the productdetail page
		And I fill in:
		|comment|post a example comment here|
		And I press "Post" button
		Then I see message "post a example comment here" 
