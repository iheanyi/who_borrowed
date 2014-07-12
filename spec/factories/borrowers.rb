# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :borrower do
    name "MyString"
    facebook_id "MyString"
    user_id nil
  end
end
