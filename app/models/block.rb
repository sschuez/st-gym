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

  # == Validations ==========================================================
  
  # == Scopes ===============================================================
  
  # == Callbacks ============================================================
  
  # == Class Methods ========================================================
  
  # == Instance Methods =====================================================
  
end
