#associated with the owner
class Questionnaire < ApplicationRecord
  has_many :questions
  belongs_to :listing
end

