class Workout < ApplicationRecord
  #Organisation Model (Shortcut: mstr)
  # == Constants ============================================================
  WEEKDAY = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
  
  # == Attributes ===========================================================
  
  # == Extensions ===========================================================
  
  # == Relationships ========================================================
  has_many :blocks, dependent: :destroy
  broadcasts
  
  # == Validations ==========================================================
  
  # == Scopes ===============================================================
  
  # == Callbacks ============================================================
  
  # == Class Methods ========================================================
  
  # == Instance Methods =====================================================
  
end