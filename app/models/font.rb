class Font < ActiveRecord::Base
  mount_uploader :typeface, TypefaceUploader

  attr_accessible :name, :typeface

  has_and_belongs_to_many :themes
  has_many :glyphs

  accepts_nested_attributes_for :glyphs

  validates :typeface, presence: true
end
