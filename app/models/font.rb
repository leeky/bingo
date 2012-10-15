class Font < ActiveRecord::Base
  mount_uploader :typeface, TypefaceUploader

  attr_accessible :name, :typeface, :dingbat

  default_scope order: 'dingbat, name'

  has_and_belongs_to_many :themes
  has_many :glyphs

  validates :typeface, presence: true
end
