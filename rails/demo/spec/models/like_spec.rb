require 'rails_helper'

RSpec.describe Like, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before :each do
	  like = build(:like)
	end
  # it "should be belongs to product"
  	it {expect(like).to belong_to(:product)}
  # it "should be belongs to user"
  	it {expect(like).to belong_to(:user)}
end
