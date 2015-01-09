require 'rails_helper'

RSpec.describe User, :type => :model do
	before :each do
	  user = build(:user)
	end
  # pending "add some examples to (or delete) #{__FILE__}"
  # it "is valid with a firstname, lastname, email" do
  	it {expect(user).to be_valid}
  # it "is invalid without firstname" do
  	it {expect(user).to validate_presence_of(:firstname)}
  # # it "is invalid without lastname"
  	it {expect(user).to validate_presence_of(:lastname)}
  # # it "is invalid without email"
  	it {expect(user).to validate_presence_of(:email)}
  # # it "is invalid with a duplicate email"
  	it {expect(user).to validate_uniqueness_of(:email)}
  # # it "is invalid with a firstname be longer than 5 character"
  	it {expect(user).to validate_length_of(:firstname).is_at_least(5)}
  # # it "is invalid with a lastname be longer than 5 character"
  	it {expect(user).to validate_length_of(:lastname).is_at_least(5)}
  # # it "is invalid with an invalid email"
  	it "is invalid with an invalid email" do
  		expect(user).to allow_value("dhh@nonopinionated.com").for(:email)
  		expect(user).to_not allow_value("base@example").for(:email)
  		expect(user).to_not allow_value("blah").for(:email)
  	end
  # it "have many products"
  	it { expect(user).to have_many(:products) }
  # it "have many comments"
  	it { expect(user).to have_many(:comments) }
  # it "have many likes"
  	it { expect(user).to have_many(:likes) }
end
