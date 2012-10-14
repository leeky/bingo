class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  attr_accessible :name, :image

  has_and_belongs_to_many :themes

  validates :image, presence: true
end
