class ExerciseInstance < ApplicationRecord
  belongs_to :exercise
  belongs_to :block

  delegate :session, to: :block

  enum quantity: { more: 1, less: -1, cancel: 0 }
end
