require 'rails_helper'

RSpec.describe Image, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before :each do
	  image = build(:image)
	end
  # it "is valid with a url"
  	it {expect(image).to be_valid}
  # it "is invalid without a url"
  	it {expect(image).to validate_presence_of(:url)}
end
