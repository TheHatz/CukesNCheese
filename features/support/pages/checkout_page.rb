require_relative 'error_panel'
require_relative 'side_menu_panel'

class CheckoutPage
  include PageObject
  include DataMagic
  include ErrorPanel
  include SideMenuPanel


  #DEFAULT_DATA = {
  #    'name' =>     Faker::Name.name,
  #    'address' =>  Faker::Address.street_address,
  #    'email' =>    Faker::Internet.email,
  #    'pay_type' => 'Purchase order'
  #}

  # PageObject allows for the magic below!
  text_field(:name, :id => 'order_name')
  text_field(:address, :id => 'order_address')
  text_field(:email, :id => 'order_email')
  select_list(:pay_type, :id => 'order_pay_type')
  button(:place_order, :value => 'Place Order')


  def checkout(data = {})
    # use this line with DEFAULT Data
    #data = populate_page_with DEFAULT_DATA.merge(data)

    # use this line with Faker data
    populate_page_with data_for(:checkout_page_rdm, data)

    # use the code below if NOT using 'populate_page_with' form PageObject
    #self.name = data['name']
    #self.address = data['address']
    #self.email = data['email']
    #self.pay_type = data['pay_type']

    place_order
  end

end