FactoryGirl.define do
  factory :user do
    first_name "Harry"
    last_name "Potter"
    email "harry.potter@magic.com"
    password "abcd1234"
    password_confirmation "abcd1234"

    consumer_contact
  end
end
