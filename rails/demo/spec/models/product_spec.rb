require 'rails_helper'

RSpec.describe Product, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before :each do
	  product = build(:product)
	end
  # it "is valid with a title, price, description"
  	it {expect(product).to be_valid}
  # it "is invalid without a title"
  	it {expect(product).to validate_presence_of(:title)}
  # it "is invalid without a price"
  	it {expect(product).to validate_presence_of(:price)}
  # it "is invalid without a description"
  	it {expect(product).to validate_presence_of(:description)}
  # it "is invalid with a price = 0"
  	it {expect(product).to_not allow_value(0).for(:price)}
  # it "is invalid with a price is not a number"
  	it {expect(product).to validate_numericality_of(:price) }
  # it "is invalid with a description be longer than 10 characters"
  	it {expect(product).to validate_length_of(:description).is_at_least(10)}
  # it "will be belong to user"
  	it {expect(product).to belong_to(:user)}
  # it "will be belong to category"
  	it {expect(product).to belong_to(:category)}
  # it "have many comments"
  	it {expect(product).to have_many(:comments)}
  # it "have many likes"
  	it {expect(product).to have_many(:likes)}
end
