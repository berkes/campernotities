class Camping < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :author, :class_name => AdminUser

  def short_description
    description.slice(0,140)
  end
end
