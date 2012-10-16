class CardSet < ActiveRecord::Base
  attr_accessible :name, :quantity, :columns, :rows, :font_id, :theme_id

  validates :name, :quantity, :columns, :rows, presence: true
  validates :quantity, :rows, :columns, numericality: true

  belongs_to :font
  belongs_to :theme
end
