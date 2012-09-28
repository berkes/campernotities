class Camping < ActiveRecord::Base
  attr_accessible :description

  def short_description
    description.slice(0,140)
  end
end
