class Photo < ActiveRecord::Base
  belongs_to :room
  validates :my_file, presence: true
  mount_uploader :my_file, FileUploader
end
