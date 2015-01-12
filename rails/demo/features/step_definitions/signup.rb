Given(/^I visit the ([a-zA-Z_]+) page$/) do |page|
  # pending # express the regexp above with the code you wish you had
  visit "/" + page
end

When(/^I fill in:$/) do |table|
  # table is a Cucumber::Ast::Table
  # pending # express the regexp above with the code you wish you had
  table = table.raw
  table.each do |row|
  	fill_in(row[0], :with => row[1])
  end
end

When(/^I press "(.*?)" button$/) do |button|
  # pending # express the regexp above with the code you wish you had
  click_button(button)
end

Then(/^I see message "(.*?)"$/) do |message|
  # pending # express the regexp above with the code you wish you had
  page.should have_content(message)
end

