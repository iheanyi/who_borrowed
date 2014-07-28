class Borrower < ActiveRecord::Base
  belongs_to :user
  has_many :loans, :foreign_key => "borrower_id", dependent: :destroy
  has_many :items, :through =>  :loans


  validates :name, presence: true, length: { minimum: 1 }

end
