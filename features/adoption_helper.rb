module AdoptionHelper

  require 'rubygems'
  require 'watir-webdriver'

  def adopt_puppy_Number(num)
    @browser.button(:value => 'View Details', :index => num - 1).click
    @browser.button(:value => 'Adopt Me!', :index => 0).click
  end

  def continue_adopting_puppies
    #Adopt Another Puppy
    @browser.button(:value => 'Adopt Another Puppy').click
  end

  def checkout_with(order_name, order_address, order_email, order_pay_type)
#Fill order form and Place Order
    @browser.button(:value => 'Complete the Adoption').click
    @browser.text_field(:id => 'order_name').set('George')
    @browser.text_field(:id => 'order_address').set('123 Broad Street, Richmond, Va')
    @browser.text_field(:id => 'order_email').set('1@1.com')
    @browser.select_list(:id => 'order_pay_type').select('Check')
    @browser.button(:value => 'Place Order').click
  end

  def verify_page_contains(success_text)
    fail 'Browser text did not match expected value: ' + success_text unless @browser.text.include? success_text

#Save a screen shot
    @browser.screenshot.save('/Users/GHatzikotelis1/Cucumber/getting_started/test.png')
  end

  def goto_puppy_adoption_site site
    @browser.goto(site)
  end

  def close_browser
    @browser.close
  end


end