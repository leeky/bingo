class Glyph < ActiveRecord::Base
  attr_accessible :name

  belongs_to :font
end
