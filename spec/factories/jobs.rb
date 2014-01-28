# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    title "Sample job"
    description "I think this is a sample job"
    application_due_date "2014-01-17 08:17:19"
    marriage
  end
end
