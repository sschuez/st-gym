class Exercise < ApplicationRecord
  has_many :exercise_categories
  has_many :categories, through: :exercise_categories, dependent: :destroy
  has_many :exercise_instances, dependent: :destroy
  belongs_to :user
  has_many_attached :files

  validates :name, presence: true
  
  scope :ordered, -> { order(name: :asc) }
  scope :by_category, -> (category_id) { joins(:exercise_categories).where(exercise_categories: { category_id: category_id }) }
  scope :by_user, -> (user_id) { where(user_id: user_id) }
  scope :by_main_category, -> (main_category_id) { joins(:exercise_categories).where(exercise_categories: { category_id: main_category_id }) }
  scope :by_main_and_other_category, -> (main_category_id, other_category_id) { by_main_category(main_category_id) & by_category(other_category_id) }

  def duration
    seconds_for_exercise = 2
    seconds_for_rest = 1
    seconds_for_exercise + seconds_for_rest
  end
end
