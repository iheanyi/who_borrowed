class Item < ActiveRecord::Base
  has_attached_file :image, :default_url => "http://placehold.it/150x150"
  belongs_to :category
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
end
