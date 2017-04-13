class Personalitystorage < ApplicationRecord
  has_many :questions
  has_many :answers

  validates :session, presence: true
  validates_uniqueness_of :session, :scope => [:question_id, :answer_id]
end
