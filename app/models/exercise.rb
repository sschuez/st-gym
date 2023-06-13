class Exercise < ApplicationRecord
  has_many :exercise_categories
  has_many :categories, through: :exercise_categories, dependent: :destroy
  has_many :exercise_instances, dependent: :destroy
  has_many_attached :files

  validates :name, presence: true
  
  scope :by_category, -> (category_id) { where(category_id: category_id) }
  scope :ordered, -> { order(name: :asc) }

  def duration
    seconds_for_exercise = 2
    seconds_for_rest = 1
    seconds_for_exercise + seconds_for_rest
  end
end
