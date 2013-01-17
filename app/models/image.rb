class Image < ActiveRecord::Base
  attr_accessible :alt, :image

  # Paperclip
  has_attached_file :image
end
