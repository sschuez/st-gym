class ExerciseInstancesController < ApplicationController
  skip_before_action :authenticate_user!#, only: [ :new, :show ]
  before_action :set_session
  # before_action :set_exercisable

  def new
    @exercise_instance = ExerciseInstance.new
    @exercises = Exercise.all
    if params[:block_id]
      @block = Block.find(params[:block_id])
    end
  end
  
  def create
    @parent = parent
    @exercise_instance = @parent.exercise_instances.new(exercise_instance_params)
    # raise
    respond_to do |format|
      if @exercise_instance.save
        # @exercise_instance.broadcast_prepend_later_to @exercise_instance.session
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            "exercise_instances",
            partial: "exercise_instances/exercise_instance",
            locals: { exercise_instance: @exercise_instance })
        end
        format.html { redirect_to @session, notice: "Exercise instance was successfully created." }
        format.json { render :show, status: :created, location: @exercise_instance }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            'new_exercise_instance',
            partial: "exercise_instances/form_modal",
            locals: {exercise_instance: @exercise_instance})
        end
      end
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @exercise_instance.errors, status: :unprocessable_entity }
    end
  end

  private

  def set_session
    @session = Session.find(params[:session_id])
  end

  def exercise_instance_params
    params.require(:exercise_instance).permit(:exercise_id, :repetitions, :time, :block_id, :session_id)
    # params.require(:block).permit(:exercise_id, :session_id, :block_id, :repetitions, :time, :exercisable)
  end


  def parent
    return Block.find params[:block_id] if params[:block_id]
    Session.find params[:session_id] if params[:session_id]
 end

#  def comment_params
#     params.require(:comment).permit(:body).merge(user_id: current_user.id)
#  end
end
