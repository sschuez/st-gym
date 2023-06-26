class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workouts
  has_many :exercises, dependent: :nullify
  has_many :categories, through: :exercises
  has_many :visits, class_name: "Ahoy::Visit"

  def main_categories
    categories.main_categories
  end

  def other_categories
    categories.other_categories
  end

  def main_categories_with_exercises
    categories.main_categories_with_exercises
  end

  def exercises_per_category(category_id)
    exercises.by_category(category_id)
  end

  def exercises_per_main_category(main_category_id)
    exercises.by_main_category(main_category_id)
  end

  def exercises_per_main_and_other_category(main_category_id, other_category_id)
    exercises.by_main_and_other_category(main_category_id, other_category_id)
  end
end
