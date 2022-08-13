class RepetitionsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def update
    @exercise_instance = GlobalID::Locator.locate_signed(params[:sgid])
    
    if params[:request_type] == "update_quantity"
      @exercise_instance.toggle! :tabata
    elsif params[:kind] == "repetitions"
      new_repetitions = @exercise_instance.repetitions += params[:increment]
      @exercise_instance.update(repetitions: new_repetitions)
    else
      new_time = @exercise_instance.time += params[:increment]
      @exercise_instance.update(time: new_time)
    end
    head :ok
  end
  
end
