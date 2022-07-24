class Exercise < ApplicationRecord
  belongs_to :category
  has_many :exercise_instances

  validates :name, presence: true
end
