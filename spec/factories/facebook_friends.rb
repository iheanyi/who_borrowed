# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :facebook_friend do
    user_id nil
    name "MyString"
    facebook_id "MyString"
  end
end
