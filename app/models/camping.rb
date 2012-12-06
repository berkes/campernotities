class Camping < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :author, :class_name => AdminUser
  validates_presence_of :author

  def short_description
    if description.nil?
      ""
    else
      description.slice(0,140)
    end
  end
end
