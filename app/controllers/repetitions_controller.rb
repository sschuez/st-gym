class RepetitionsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def update
    @exercise_instance_or_block = GlobalID::Locator.locate_signed(params[:sgid])
    authorize @exercise_instance_or_block
    
    if params[:request_type] == "update_quantity"
      @exercise_instance_or_block.toggle! :tabata
    elsif params[:kind] == "repetitions"
      new_repetitions = @exercise_instance_or_block.repetitions += params[:increment]
      @exercise_instance_or_block.update(repetitions: new_repetitions)
    else
      new_time = @exercise_instance_or_block.time += params[:increment]
      @exercise_instance_or_block.update(time: new_time)
    end
    respond_to do |format|
      format.turbo_stream
    end
    # head :ok
  end
  
end
