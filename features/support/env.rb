require 'rspec'
require 'page-object'
require 'faker'
require 'data_magic'
require 'require_all'
require 'factory_girl'
require 'nokogiri'
require 'builder'




#require_all '/Users/GHatzikotelis1/Cucumber/test_puppies/features/support/pages'
require_rel 'pages'

World PageObject::PageFactory
World(FactoryGirl::Syntax::Methods)



PageObject::PageFactory.routes = {
    :default => [[HomePage, :select_puppy],
                 [DetailsPage, :add_to_cart],
                 [ShoppingCartPage, :proceed_to_checkout],
                 [CheckoutPage, :checkout]]
}


