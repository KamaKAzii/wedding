FactoryGirl.define do
  factory :user do
    first_name "Harry"
    last_name "Potter"
    email "harry.potter@magic.com"
    password "abcd1234"
    password_confirmation "abcd1234"
    user_type 1

    consumer_contact
  end
end
