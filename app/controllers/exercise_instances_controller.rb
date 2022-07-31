class ExerciseInstancesController < ApplicationController
  skip_before_action :authenticate_user!#, only: [ :new, :show ]
  before_action :set_session, only: [ :new, :create ]
  before_action :set_block, only: [ :new, :create ]

  def new
    @exercise_instance = @block.exercise_instances.new
    # @exercises = Exercise.all
  end
  
  def create
    @exercise_instance = @block.exercise_instances.new(exercise_instance_params)
    respond_to do |format|
      if @exercise_instance.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            "block_#{@block.id}_exercise_instances",
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

  def set_block
    @block = Block.find(params[:block_id])
  end

  def exercise_instance_params
    params.require(:exercise_instance).permit(:exercise_id, :repetitions, :time, :block_id, :session_id)
  end
end
