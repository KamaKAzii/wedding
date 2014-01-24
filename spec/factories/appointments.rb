# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    title "MyString"
    date "2014-01-25"
    user nil
  end
end
