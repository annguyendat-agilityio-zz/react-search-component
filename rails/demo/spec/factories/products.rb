FactoryGirl.define do
  factory :product do
  	title Faker::Name.title
		price Faker::Commerce.price
		description Faker::Lorem.sentence
	end
end
