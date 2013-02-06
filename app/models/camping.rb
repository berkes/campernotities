class Camping < ActiveRecord::Base
  attr_accessible :description, :name, :images_attributes

  belongs_to :author, :class_name => AdminUser
  validates_presence_of :author
  validate :should_have_images

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

  def should_have_images
    errors.add(:base, "At least one image is required") if images.blank?
  end
end
