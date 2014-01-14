# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :couple do
    first_partner_id 1
    second_partner_id 1
    marriage nil
  end
end
