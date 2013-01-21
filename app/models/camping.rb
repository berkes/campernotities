class Camping < ActiveRecord::Base
  attr_accessible :description, :name, :images_attributes

  belongs_to :author, :class_name => AdminUser
  validates_presence_of :author
  validates_presence_of :name
  validates_presence_of :images, :message => "At least one image is required"

  has_many :images
  accepts_nested_attributes_for :images, :allow_destroy => true

  default_scope order("created_at")

  # Scope for "top" campings
  def self.top(amount)
    order(:created_at).limit(amount)
  end

  # Utility for fetching the main image
  def main_image
    images.first.image
  end

  def short_description
    if description.nil?
      ""
    else
      description.slice(0,140)
    end
  end
end
