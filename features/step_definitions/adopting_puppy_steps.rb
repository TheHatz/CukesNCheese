
Then(/^I should see the error message "(.+)"$/) do |errMsg|
  # Directly check the message on the checkout page
  # on(CheckoutPage).error_messages.should include errMsg

  # Generically check for an error message within an error panel on any page
  #@current_page.error_messages.should include errMsg
  @current_page.should have_error_message errMsg
end


Given(/^I am on the puppy adoption site$/) do
  visit(HomePage)
end


When(/^I click the View Details button for "(.*?)"$/) do  |puppy|
  on(HomePage).select_puppy puppy
end


And(/^I click the Adopt Me button$/) do
  on(DetailsPage).add_to_cart
end


And(/^I click the Complete the Adoption button$/) do
  on(ShoppingCartPage).proceed_to_checkout
end


And(/^I enter "(.*?)" in the name field$/) do |order_name|
  on(CheckoutPage).name = order_name
end


And(/^I enter "(.*?)" in the address field$/) do |order_address|
  on(CheckoutPage).address = order_address
end


And(/^I enter "(.*?)" in the email field$/) do |order_email|
  on(CheckoutPage).email = order_email
end

And(/^I select "(.*)" from the pay with dropdown$/) do |pay_type|
  on(CheckoutPage).pay_type = pay_type
end

And(/^I click the Place Order button$/) do
  on(CheckoutPage).place_order
end

And(/^I click the Adopt Another Puppy button$/) do
  on(ShoppingCartPage).continue_shopping
end

Then(/^I should see "(.*?)"$/) do |expected|
  @browser.screenshot.save('/Users/GHatzikotelis1/Cucumber/getting_started/test.png')
  on(HomePage).text.should include expected
  #Save a screen shot

end


Then(/^I should see "(.*?)" as the name for (line item \d+)$/) do |name, line_item|
  on(ShoppingCartPage).name_for_line_item(line_item).should include name
end


And (/^I should see "(.*?)" as the subtotal for (line item \d+)$/) do |item_price, line_item|
    on(ShoppingCartPage).subtotal_for_line_item(line_item).should == item_price
end


And (/^I should see "(.*?)" as the cart total$/) do |cart_total|
   on(ShoppingCartPage).cart_total.should == cart_total
end

And(/^I complete the adoption with:$/) do |table|
  # table is a Cucumber::Ast::Table

  on(CheckoutPage) do |page|
    page.checkout(table.hashes.first)
  end
end

And (/^I complete the adoption using a Credit card$/) do
  #Override the default data and set the credit card as the pay_type
  on(CheckoutPage).checkout('pay_type' => 'Credit card')
end

And (/^I complete the adoption$/) do
  on(CheckoutPage).checkout
end

When (/^I complete the adoption of a puppy$/) do
  #use the default route:
  navigate_all

  # code below doesn't use the 'routes' functionality
  #on(HomePage).select_puppy
  #on(DetailsPage).add_to_cart
  #on(ShoppingCartPage).proceed_to_checkout
  #on(CheckoutPage).checkout()
end

When(/^I checkout leaving the name field blank$/) do
  #use the navigate_to functionality to 'skip' the first 3 pages
  navigate_to(CheckoutPage).checkout('name' => '')

  # code below doesn't use the 'routes' functionality
  #on(HomePage).select_puppy
  #on(DetailsPage).add_to_cart
  #on(ShoppingCartPage).proceed_to_checkout
  #on(CheckoutPage).checkout('name' => '')
end



When(/^I click the Adoptions button$/) do
  on(HomePage).adoptions
end


And(/^I process a pending adoption$/) do
  on(ProcessPuppyPage).process_first_puppy
end


Then(/^I should see the thank you message$/) do
  on(HomePage).text.should include 'Please thank'
end

Given(/^I have a pending adoption for "(.*?)"$/) do |adopter|
  # use this code to add the adoption using the website
  ## navigate_to(CheckoutPage).checkout('name' => adopter)

  # use this code to insert the adoption directly into the database
  order = build(:order_faker, :name => adopter)
  create(:adoption, :order => order)
end

When(/^I process that adoption$/) do
  visit(AdminLandingPage)
  on(LoginPage).log_in('steve', 'secret')
  on(AdminLandingPage).adoptions
  on(ProcessPuppyPage).process_first_puppy

end


# Database feature steps
Given(/^I know how many orders I have$/) do
  @number_orders = Order.count
end

When(/^I create a new order$/) do
  create(:order)

  # create the order 'manually' below vs. using factory_girl above.
  #order = Order.new
  #order.name = "George"
  #order.address = "100 Broad Road"
  #order.email = "Cheezy@example.com"
  #order.pay_type = "Check"
  #order.save
end

Then(/^I should have (\d+) additional order$/) do |additional_orders|
  Order.count.should == @number_orders + additional_orders.to_i

end


Given (/^I have an order for "([^"]*)"$/)  do  |name|

  create(:order, :name => name)

  # create the order 'manually' below vs. using factory_girl above.
  #order = Order.new
  #order.name = name
  #order.address = '100 Broad Road'
  #order.email = '1@1.com'
  #order.pay_type = 'Credit card'
  #order.save

  @original_name = name
end

When (/^I read that order$/) do
  @order = Order.find_by_name(@original_name)
end

Then /^the order should have the name "([^"]*)"$/ do |name|
  @order.name.should == name
end

When(/^I update the name to "([^"]*)"$/) do |name|
  order = Order.find_by_name(@original_name)
  order.name = name
  order.save
end

Then(/^I should have a record for "([^"]*)"$/) do |name|
  order = Order.find_by_name(name)
  order.should_not be_nil
end

Then(/^I should not have a record for "(.*?)"$/) do |name|
  order = Order.find_by_name(name)
  order.should be_nil
end

When(/^I delete that order$/) do
  order = Order.find_by_name(@original_name)
  order.delete
end

Then (/^the adoption delivered on date should be set to the current time$/) do
  adoption = Adoption.first

  #t = Adoption.first.delivered_on
  db_time = Time.parse(adoption.delivered_on.to_s(:db) + "UTC")

  #adoption.delivered_on.should be_on_or_near_the_time Time.now + (60*60*5)
  db_time.should be_on_or_near_the_time Time.now

end