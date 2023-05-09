class Exercise < ApplicationRecord
  belongs_to :category
  has_many :exercise_instances, dependent: :destroy

  validates :name, presence: true

  def duration
    seconds_for_exercise = 2
    seconds_for_rest = 1
    seconds_for_exercise + seconds_for_rest
  end

end
