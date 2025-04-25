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

  delegate :main_categories, to: :categories

  delegate :other_categories, to: :categories

  def email_username
    email.split("@").first
  end
end
