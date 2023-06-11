class Category < ApplicationRecord
  has_many :exercise_categories, dependent: :destroy
  has_many :exercises, through: :exercise_categories

  scope :ordered, -> { order(:name) }
  
  def self.main_categories
    self.where(name: ["functional", "gym"]).order(:name)
  end

  def self.other_categories
    self.all.order(:name) - self.main_categories
  end

  def self.main_categories_first
    self.main_categories + self.other_categories
  end
end
