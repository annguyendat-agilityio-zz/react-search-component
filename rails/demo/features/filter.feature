Feature: Filter 
As an unauthorized user
I want to filter product
	
	Backgound:
		Given a product with:
		|title			|Nike Black T-lite Xi Sl Training Sports Shoes|
		|price 			|$50|
		|description|A pair of round-toed|
		And a product with:
		|title			|Nike White|
		|price 			|$20|
		|description|A pair of round-toed|
		And a product with:
		|title			|Nike Red|
		|price 			|$38|
		|description|A pair of round-toed|
		And a product with:
		|title			|Nike Black T-lite XLL|
		|price 			|$30|
		|description|A pair of round-toed|
		When I visit the filter page

  Scenario: Filter by name
		And I fill in:
		|SearchBar	|Nike Black|
		Then I see message "Nike Black T-lite Xi Sl Training Sports Shoes"
		And I see message "Nike Black T-lite XLL"

	Scenario: Filter by price
		And I fill in:
		|PriceFrom	|25|
		|PriceTo	|40|
		Then I see message "Nike Red"
		And I see message "Nike Black T-lite XLL"


