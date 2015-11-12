require 'rails_helper'

RSpec.describe Category, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before :each do
	  category = build(:category)
	end
  # it "is valid with a title"
  	it {expect(category).to be_valid}
  # it "is invalid without a title"
  	it {expect(category).to validate_presence_of(:title)}
  # it "have many products"
  	it {expect(category).to have_many(:products)}
end
