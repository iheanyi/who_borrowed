# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "test@example.com"
    name "Johnny Test"
    username "test_user"
    password "abc123"
    password_confirmation "abc123"
  end
end
