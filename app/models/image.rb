class Image < ActiveRecord::Base
  attr_accessible :alt, :image

  # Paperclip
  has_attached_file :image,
    :styles => { :thumb => "150x150>" }
  validates :image, 
    :presence => :true,
    :attachment_content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png"] },
    :attachment_size => { :in => 0..5.megabytes }
end
