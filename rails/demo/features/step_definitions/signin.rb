Given(/^an User "(.*?)" exists with password "(.*?)"$/) do |username, password|
  # pending # express the regexp above with the code you wish you had
  @user = FactoryGirl::create(:user)
end

Given(/^I am not logged in$/) do
  pending # express the regexp above with the code you wish you had 
end

Then(/^I should be on the home page$/) do
  expect(current_path).to eq(root_path)
end
