class Image < ActiveRecord::Base
  belongs_to :uploader, :class_name => 'User'

  mount_uploader :file, ImageUploader

  # These are enforced by database constraints
  validates :file, :presence => true
  validates :width, :presence => true
  validates :height, :presence => true
  validates :unique_hash, :presence => true
  validates :bytes, :presence => true
  validates :uploader_id, :presence => true

  scope :latest, :order => 'created_at desc'
end
