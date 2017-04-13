class Answer < ApplicationRecord
  has_many :personalities
  has_many :personality_storages
  has_many :questionnaires

  # mount_uploader :photo, PhotoUploader
end
