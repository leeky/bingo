class Glyph < ActiveRecord::Base
  attr_accessible :name, :ascii

  belongs_to :font
end
