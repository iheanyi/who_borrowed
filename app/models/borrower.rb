class Borrower < ActiveRecord::Base
  belongs_to :user
  has_many :loans, :foreign_key => "borrower_id"
  has_many :items, :through =>  :loans

  #accepts_nested_attributes_for :loans

end
