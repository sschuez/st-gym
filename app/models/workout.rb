class Workout < ApplicationRecord
  # Organisation Model (Shortcut: mstr)
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
  scope :lonely_and_due, -> { where("created_at <= :hours_ago", hours_ago: 24.hours.ago).where(user_id: nil) }

  # == Callbacks ============================================================
  broadcasts

  after_create_commit do
    broadcast_append_later_to(self)
  end

  after_update_commit do
    broadcast_replace_later_to self,
                               target: "workout_#{id}_header",
                               partial: "workouts/workout_header",
                               locals: { workout: self }
  end

  after_destroy_commit do
    broadcast_remove_to(self)
  end

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  def rounded_duration(seconds = duration)
    ((seconds / 60.to_f) / 5).ceil * 300
  end

  def duration
    seconds_for_blocks = blocks.sum(&:duration)
    last_block_rest = blocks.count < 2 ? 0 : blocks.last.seconds_for_rest
    seconds_for_blocks - last_block_rest
  end
end
