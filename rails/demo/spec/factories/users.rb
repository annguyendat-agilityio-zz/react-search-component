FactoryGirl.define do
	factory :user do
  	firstname Faker::Name.first_name
		lastname Faker::Name.last_name
		sequence(:email) { |n| "johndoe#{n}@demo.com"}
		password "foobar"
		password_confirmation { |u| u.password }
		factory :invalid_user do
			email nil
		end
		factory :admin do
			email "admin@demo.com"
		end
	end
end
