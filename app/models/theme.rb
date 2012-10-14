class Theme < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :fonts
  has_and_belongs_to_many :pictures
end
