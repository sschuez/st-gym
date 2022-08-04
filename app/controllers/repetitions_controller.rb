class RepetitionsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def update
    @exercise_instance = GlobalID::Locator.locate_signed(params[:sgid])
    new_repetitions = @exercise_instance.repetitions += params[:change_repetitions]
    @exercise_instance.update(repetitions: new_repetitions)
    head :ok
  end
  
end
