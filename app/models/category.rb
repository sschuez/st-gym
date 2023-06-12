class Category < ApplicationRecord
  has_many :exercise_categories, dependent: :destroy
  has_many :exercises, through: :exercise_categories

  scope :ordered, -> { order(:name) }
  scope :main_categories, -> { where(main_category: true).order(:name) }
  scope :other_categories, -> { where(main_category: false).order(:name) }
  scope :main_categories_first, -> { main_categories + other_categories }
end
