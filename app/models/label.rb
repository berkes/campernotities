class Label < ActiveRecord::Base
  attr_accessible :name, :value

  belongs_to :camping

  validates_presence_of :name
  validates_length_of :name, :within => 2..60
end
