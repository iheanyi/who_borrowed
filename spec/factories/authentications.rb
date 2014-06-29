# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentication do
    user_id 1
    provider "MyString"
    uid "MyString"
    name "MyString"
    oauth_token "MyString"
    oauth_expires_at "2014-06-29 15:30:46"
  end
end
