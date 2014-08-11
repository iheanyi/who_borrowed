class Item < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "http://placehold.it/100x125"
  belongs_to :category
  belongs_to :user

  has_many :loans, :foreign_key => "item_id"
  has_many :borrowers, :through => :loans

  validates :name, presence: true
  validates :user_id, presence: true
  #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
