Given(/^I am logged in$/) do
  # pending # express the regexp above with the code you wish you had
  expect(@current_user).not_to be_nil
end

When(/^I upload the image$/) do
  # pending # express the regexp above with the code you wish you had
  attach_file(:image_file, File.join(Rails.root, 'features', 'upload-files', 'products_image.jpg'))
end

Given(/^a product with:$/) do |table|
	@product = FactoryGirl.create(:product, table.rows_hash)
end

Then(/^I see the exists product with:$/) do |table|
  # table is a Cucumber::Ast::Table
  # pending # express the regexp above with the code you wish you had
  expect(Product.where(table.rows_hash).count).to be > 0
end

Then(/^I see total like increase$/) do
  # pending # express the regexp above with the code you wish you had
  expect(@product.likes.count).to be = 1
end
