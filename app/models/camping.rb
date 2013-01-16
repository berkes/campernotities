class Camping < ActiveRecord::Base
  attr_accessible :description, :name, :image

  belongs_to :author, :class_name => AdminUser
  validates_presence_of :author

  default_scope order("created_at")

  # Paperclip
  has_attached_file :image

  def short_description
    if description.nil?
      ""
    else
      description.slice(0,140)
    end
  end
end
