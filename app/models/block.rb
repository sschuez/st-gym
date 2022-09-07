class Block < ApplicationRecord
  #Organisation Model (Shortcut: mstr)
  # == Constants ============================================================
  
  # == Attributes ===========================================================
  
  # == Extensions ===========================================================
  
  # == Relationships ========================================================
  belongs_to :workout, dependent: :destroy
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
  
end
