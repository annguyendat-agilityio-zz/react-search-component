Feature: Search 
As an unauthorized user
I want to search product

  Scenario: Search
		Given a product with:
		|title			|Nike Black T-lite Xi Sl Training Sports Shoes|
		|price 			|$38|
		|description|A pair of round-toed|
		And a product with:
		|title			|Nike White|
		|price 			|$38|
		|description|A pair of round-toed|
		And a product with:
		|title			|Nike Red|
		|price 			|$38|
		|description|A pair of round-toed|
		And a product with:
		|title			|Nike Black T-lite XLL|
		|price 			|$38|
		|description|A pair of round-toed|
		When I visit the home page
		And I fill in:
		|SearchBar	|Nike Black|
		And I press "Search" button
		Then I visit the "SearchResult" page
		Then I see message "Nike Black T-lite Xi Sl Training Sports Shoes"
		And I see message "Nike Black T-lite XLL"
