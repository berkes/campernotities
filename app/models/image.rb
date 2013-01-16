class Image < ActiveRecord::Base
  attr_accessible :alt

  # Paperclip
  has_attached_file :image
end
