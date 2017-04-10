class Artwork < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :artist

  validates :title, :artist, :year, :mediums, presence: true
end
