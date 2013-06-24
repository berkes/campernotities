class Camping < ActiveRecord::Base
  attr_accessible :description, :name, :images_attributes, :labels_attributes, :latitude, :longitude, :website

  after_find :set_fallback_images

  belongs_to :author, :class_name => AdminUser
  validates_presence_of :author

  has_many :labels
  accepts_nested_attributes_for :labels

  has_many :images
  accepts_nested_attributes_for :images, :allow_destroy => true

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  validate :lat_lon_combination
  validates :latitude, :numericality  => { :greater_than_or_equal_to => -90, :less_than_or_equal_to  => 90 }, :allow_blank  => true
  validates :longitude, :numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180 }, :allow_blank => true

  validates :website,
    :length => { :maximum => 255 },
    :format => { :with => URI::regexp(%w(http https)) },
    :allow_nil => true
  before_validation :ensure_website_has_protocol

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

  # Validation callbacks
  def lat_lon_combination
    if (latitude.blank? ^ longitude.blank?)
      errors.add(:base, "When providing a location, both Latitude and Longitude should be provided")
    end
  end
  def ensure_website_has_protocol
    unless website.nil?
      self.website = "http://#{website}" if URI.parse(website).scheme.nil?
    end
  end

  private
  def set_fallback_images
    self.images << Image.new if images.count == 0
  end
end
