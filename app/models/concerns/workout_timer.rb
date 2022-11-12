module WorkoutTimer
  extend ActiveSupport::Concern

  included do
    
    BREAK_TIME_BLOCK = 120
    BREAK_TIME_EXERCISE = 20
    TIME_PER_REPETITION = 3
  
    def time_it_takes
      return 0 unless self.blocks.any?
      
      counter = 0
      self.blocks.each do |block|
        counter += (block_time(block) + BREAK_TIME_BLOCK)
      end
      return round_time(counter)
    end

    def block_time(block)
      if block.tabata
        block.time
      else
        repetitions_time(block)
      end
    end
    
    def repetitions_time(block)
      counter = 0
      block.exercise_instances.each do |exercise|
        counter += exercise.tabata ? exercise.time : exercise.repetitions * TIME_PER_REPETITION
        # counter += BREAK_TIME_EXERCISE
      end
      counter * block.repetitions
    end

    def round_time(seconds)
      ((seconds / 60.to_f) / 5).ceil * 300
    end
  end
  
end