class Block < ApplicationRecord
  #Organisation Model (Shortcut: mstr)
  # == Constants ============================================================
  
  # == Attributes ===========================================================
  
  # == Extensions ===========================================================
  
  # == Relationships ========================================================
  belongs_to :session
  has_many :exercise_instances, dependent: :destroy
  has_many :exercises, through: :exercise_instances
  broadcasts_to :session
  
  acts_as_list scope: :session

  # == Validations ==========================================================
  
  # == Scopes ===============================================================
  
  # == Callbacks ============================================================
  after_update_commit do
    broadcast_replace_to :session, 
      # target: "exercise_instance_#{self.id}", 
      # partial: "exercise_instances/exercise_instance",
      locals: { block: self }
  end


  # == Class Methods ========================================================
  
  # == Instance Methods =====================================================
  
end
