# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :marriage do
    title "Test marriage"
    user
  end
end
