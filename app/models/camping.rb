class Camping < ActiveRecord::Base
  attr_accessible :description, :name, :image

  belongs_to :author, :class_name => AdminUser
  validates_presence_of :author

  has_many :images

  default_scope order("created_at")

  # Scope for "top" campings
  def self.top(amount)
    order(:created_at).limit(amount)
  end

  def short_description
    if description.nil?
      ""
    else
      description.slice(0,140)
    end
  end
end
