require 'open-uri'

class Item < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100", :portrait => "125x125" }, :default_url => "http://placehold.it/100x125"
  belongs_to :category
  belongs_to :user
  default_scope -> { order('name ASC') }

  has_many :loans, :foreign_key => "item_id"
  has_many :borrowers, :through => :loans



  # Image URL virtual attribute for remote uploads
  attr_accessor :image_url

  before_validation :download_remote_image, :if => :image_url_provided?
  validates_presence_of :image_remote_url, :if => :image_url_provided?, :message => "is invalid or inaccessible"

  validates :name, presence: true
  validates :user_id, presence: true

  # Image Validation
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /jpg\Z/]


  private
  # Image download functions found from this Gist, https://gist.github.com/jgv/1502777
  def image_url_provided?
    !self.image_url.blank?
  end

  def download_remote_image
    puts "Downloading remote image . . ."
    io = open(URI.parse(self.image_url))
    self.image = URI.parse(self.image_url)
    self.image_remote_url = image_url
  rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
  end
end
