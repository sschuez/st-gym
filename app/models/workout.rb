class Workout < ApplicationRecord
  #Organisation Model (Shortcut: mstr)
  # == Constants ============================================================
  WEEKDAY = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
  
  # == Attributes ===========================================================
  
  # == Extensions ===========================================================
  
  # == Relationships ========================================================
  has_many :blocks, dependent: :destroy
  belongs_to :user, optional: true
    
  # == Validations ==========================================================
  
  # == Scopes ===============================================================
  scope :published, -> { where public: true }


  # == Callbacks ============================================================
  broadcasts
  
  after_update_commit do
    broadcast_replace_later_to self,
      target: "workout_#{self.id}_header", 
      partial: "workouts/workout_header",
      locals: { workout: self }
  end

  # == Class Methods ========================================================
  
  # == Instance Methods =====================================================
  
end
