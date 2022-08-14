class ExerciseInstancesController < ApplicationController
  skip_before_action :authenticate_user!#, only: [ :new, :show ]
  before_action :set_workout, only: [ :new, :create ]
  before_action :set_block, only: [ :new, :create ]

  def new
    @exercise_instance = @block.exercise_instances.new
    # @exercises = Exercise.all
  end
  
  def create
    exercises = params[:exercise_instance][:exercise_id]
    
    exercises.each do |exercise|
      unless exercise == ""  
        
        @exercise_instance = @block.exercise_instances.new(
          exercise: Exercise.find(exercise.to_i)
        )
        respond_to do |format|
          if @exercise_instance.save
            format.turbo_stream { flash.now[:notice] = "Exercise instance was successfully created." }
            # format.html { redirect_to @workout, notice: "Exercise instance was successfully created." }
            # format.json { render :show, status: :created, location: @exercise_instance }
          else
            format.turbo_stream do
              render turbo_stream: turbo_stream.update(
                'new_exercise_instance',
                partial: "exercise_instances/form_modal",
                locals: {exercise_instance: @exercise_instance})
            end
            # format.html { render :new, status: :unprocessable_entity }
            # format.json { render json: @exercise_instance.errors, status: :unprocessable_entity }
          end
        end

      end
    end

  end

  private

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def set_block
    @block = Block.find(params[:block_id])
  end

  def exercise_instance_params
    params.require(:exercise_instance).permit(:exercise_id[], :repetitions, :time, :tabata, :block_id, :workout_id)
  end
end
