# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    street_address_1 "MyString"
    street_address_2 "MyString"
    postcode "MyString"
    date "2014-01-16 20:24:30"
    marriage nil
  end
end
