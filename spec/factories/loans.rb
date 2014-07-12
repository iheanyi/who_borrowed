# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :loan do
    borrower_id 1
    owner_id 1
    item_id 1
    loaned_on "2014-07-06 11:47:30"
    returned_on "2014-07-06 11:47:30"
    return_by "2014-07-06 11:47:30"
  end
end
