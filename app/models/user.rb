class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workouts
  has_many :exercises, dependent: :nullify

  def categories
    Category.by_user(id)
  end

  def main_categories
    categories.main_categories
  end

  def other_categories
    categories.other_categories
  end

  def email_username
    email.split('@').first
  end
end
