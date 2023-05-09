class Block < ApplicationRecord
  #Organisation Model (Shortcut: mstr)
  # == Constants ============================================================
  
  # == Attributes ===========================================================
  
  # == Extensions ===========================================================
  
  # == Relationships ========================================================
  belongs_to :workout
  has_many :exercise_instances, dependent: :destroy
  has_many :exercises, through: :exercise_instances
  
  acts_as_list scope: :workout

  # == Validations ==========================================================
  
  # == Scopes ===============================================================
  
  # == Callbacks ============================================================
  # broadcasts_to :workout
  after_create_commit do
    # broadcast_append_to(workout, locals: { user: Current.user })
    broadcast_append_later_to(workout)
  end

  after_update_commit do
    broadcast_replace_later_to(workout)# self,
      # target: "block_#{self.id}_header", 
      # partial: "blocks/block_header",
      # locals: { block: self }
  end

  after_destroy_commit do
    broadcast_remove_to(workout)
  end


  # == Class Methods ========================================================
  
  # == Instance Methods =====================================================
  def duration
    seconds_for_exercises = exercise_instances.map(&:duration).sum
    block_is_repetitions = seconds_for_exercises + seconds_for_rest()
    block_is_tabata = time + seconds_for_rest
    seconds_for_block = tabata ? block_is_tabata : block_is_repetitions 
  end

  def seconds_for_rest
    20
  end
  
end
