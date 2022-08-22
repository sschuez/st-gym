class Workout < ApplicationRecord
  #Organisation Model (Shortcut: mstr)
  # == Constants ============================================================
  WEEKDAY = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
  
  # == Attributes ===========================================================
  
  # == Extensions ===========================================================
  
  # == Relationships ========================================================
  has_many :blocks, dependent: :destroy
  belongs_to :user, optional: true
  broadcasts
  
  # == Validations ==========================================================
  
  # == Scopes ===============================================================
  scope :published, -> { where public: true }


  # == Callbacks ============================================================
  
  # == Class Methods ========================================================
  
  # == Instance Methods =====================================================
  
end
