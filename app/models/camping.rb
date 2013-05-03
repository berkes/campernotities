class Camping < ActiveRecord::Base
  attr_accessible :description, :name, :images_attributes, :labels_attributes, :latitude, :longitude, :website

  belongs_to :author, :class_name => AdminUser
  validates_presence_of :author

  has_many :labels
  accepts_nested_attributes_for :labels

  has_many :images
  accepts_nested_attributes_for :images, :allow_destroy => true
  validate :should_have_images

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  validate :lat_lon_combination
  validates :latitude, :numericality  => { :greater_than_or_equal_to => -90, :less_than_or_equal_to  => 90 }, :allow_blank  => true
  validates :longitude, :numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180 }, :allow_blank => true

  default_scope order("created_at")
  # Scope for anything with geocodes. Check for latitude-only, since we never have a record with only longitude.
  scope :geocoded, where("latitude <> 'NULL'")

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
  def lat_lon_combination
    if (latitude.blank? ^ longitude.blank?)
      errors.add(:base, "When providing a location, both Latitude and Longitude should be provided")
    end
  end
end
