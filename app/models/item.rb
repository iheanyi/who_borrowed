class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
end
