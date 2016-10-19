class Photo < ActiveRecord::Base
  belongs_to :room
  mount_uploader :my_file, FileUploader
end
