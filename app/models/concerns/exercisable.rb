module Exercisable
  extend ActiveSupport::Concern

  included do
    has_many :exercise_instances, :as => :exercisable
  end
end