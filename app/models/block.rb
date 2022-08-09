class Block < ApplicationRecord
  #Organisation Model (Shortcut: mstr)
  # == Constants ============================================================
  
  # == Attributes ===========================================================
  
  # == Extensions ===========================================================
  
  # == Relationships ========================================================
  belongs_to :workout
  has_many :exercise_instances, dependent: :destroy
  has_many :exercises, through: :exercise_instances
  broadcasts_to :workout
  
  acts_as_list scope: :workout

  # == Validations ==========================================================
  
  # == Scopes ===============================================================
  
  # == Callbacks ============================================================
  after_update_commit do
    broadcast_replace_to :workout, 
      # target: "exercise_instance_#{self.id}", 
      # partial: "exercise_instances/exercise_instance",
      locals: { block: self }
  end


  # == Class Methods ========================================================
  
  # == Instance Methods =====================================================
  
end
