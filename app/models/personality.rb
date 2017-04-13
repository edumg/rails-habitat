class Personality < ApplicationRecord
  has_many :questions
  belongs_to :profile

end
