class Font < ActiveRecord::Base
  mount_uploader :typeface, TypefaceUploader

  attr_accessible :name, :typeface

  validates :typeface, presence: true
end
