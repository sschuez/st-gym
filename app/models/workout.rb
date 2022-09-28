class Workout < ApplicationRecord
  #Organisation Model (Shortcut: mstr)
  # == Constants ============================================================
  
  # == Attributes ===========================================================
  
  # == Extensions ===========================================================
  
  # == Relationships ========================================================
  has_many :blocks, dependent: :destroy
  belongs_to :user, optional: true
    
  # == Validations ==========================================================
  
  # == Scopes ===============================================================
  scope :published, -> { where public: true }
  # scope :sanitized_published, -> { joins(:blocks).group('blocks.id').having('count(workout_id) > 1') }

  # == Callbacks ============================================================
  broadcasts
  
  after_create_commit do
    broadcast_append_later_to(self)
  end

  after_update_commit do
    broadcast_replace_later_to self,
      target: "workout_#{self.id}_header", 
      partial: "workouts/workout_header",
      locals: { workout: self }
  end
  
  after_destroy_commit do
    broadcast_remove_to(self)
  end

  # == Class Methods ========================================================

  # def self.published_sanitized(cnt = 1)
  #   select('workouts.*, count(blocks.id) as block_count')
  #     .joins(:blocks)
  #     .group('workouts.id')
  #     .having('count(blocks.id) > ?', cnt)
  # end
  
  # == Instance Methods =====================================================
  
end
