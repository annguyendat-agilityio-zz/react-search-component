Given(/^I am on the ([a-zA-Z_]+) page$/) do |page|
  # pending # express the regexp above with the code you wish you had
  visit "/" + page
end

When(/^I fill in with "(.*?)" "(.*?)" "(.*?)" "(.*?)" "(.*?)"$/) do |firstname, lastname, email, password, password_confirmation|
  # pending # express the regexp above with the code you wish you had
  fill_in('First Name', :with => firstname)
  fill_in('Last Name', :with => lastname)
  fill_in('Email', :with => email)
  fill_in('Password', :with => password)
  fill_in('Password Confirmation', :with => password_confirmation)
end

When(/^I press "(.*?)" button$/) do |button|
  # pending # express the regexp above with the code you wish you had
  click_button(button)
end

Then(/^I see message "(.*?)"$/) do |message|
  # pending # express the regexp above with the code you wish you had
  page.should have_content(message)
end

