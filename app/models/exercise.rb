class Exercise < ApplicationRecord
  belongs_to :category
  has_many :exercise_instances, dependent: :destroy

  validates :name, presence: true
end
