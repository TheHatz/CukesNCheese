require_relative 'puppy'
require_relative 'order'

FactoryGirl.define do
  factory :order do
    name 'George'
    address '321123 Broad Road - factory'
    email '1@2.com'
    pay_type 'Check'
  end
end

FactoryGirl.define do
  factory :adoption do
    association :order
    puppy Puppy.find_by_name('Brook')
  end
end


FactoryGirl.define do
  factory :order_faker, :class => Order  do
    name Faker::Name.name
    address Faker::Address.street_address
    email Faker::Internet.email
    pay_type 'Check'
  end
end

