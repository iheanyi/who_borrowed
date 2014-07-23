# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loan_reminder do
    user nil
    loan nil
    send_date "2014-07-23"
  end
end
