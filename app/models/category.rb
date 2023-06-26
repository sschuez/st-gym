class Category < ApplicationRecord
  has_many :exercise_categories, dependent: :destroy
  has_many :exercises, through: :exercise_categories

  scope :ordered, -> { order(:name) }
  scope :by_user, -> (user_id) { joins(:exercises).where(exercises: { user_id: user_id }).distinct }
  scope :main_categories, -> { where(main_category: true).order(:name) }
  scope :other_categories, -> { where(main_category: false).order(:name) }
  scope :main_categories_first, -> { main_categories + other_categories }
  scope :of_exercises, -> (exercise_ids) { joins(:exercise_categories).where(exercise_categories: { exercise_id: exercise_ids }).distinct }

  def selected_in?(exercise)
    exercise_categories.where(exercise: exercise).exists?
  end

  def self.main_categories_with_exercises
    self.main_categories.where.not(id: self.without_exercises)
  end
  
  def self.other_categories_with_exercises
    self.other_categories.where.not(id: self.without_exercises)
  end
  
  def self.without_exercises
    self.joins("LEFT JOIN exercise_categories ON exercise_categories.category_id = categories.id").where(exercise_categories: { id: nil })
  end

end

