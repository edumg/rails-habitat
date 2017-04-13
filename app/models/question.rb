class Question < ApplicationRecord
  has_many :personalities
  has_many :personality_storages
  has_many :questionnaires
end
