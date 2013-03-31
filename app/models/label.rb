class Label < ActiveRecord::Base
  attr_accessible :name, :value

  belongs_to :camping

  validates_presence_of :name
  validates_length_of :name, :within => 2..60

  scope :values, where("value")

  def self.top amount
    find(:all, :select => '*, count(*) AS count', :group => 'name', :order => 'count DESC', :limit => amount)
  end

  def options
    self.class.select(:value).where(:name => name).order("value ASC").uniq.map {|t| t.value }
  end
end
