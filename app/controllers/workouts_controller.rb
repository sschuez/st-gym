class WorkoutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :show, :edit, :update ]
  before_action :set_workout, only: %i[ show edit update destroy ]

  # GET /workouts or /workouts.json
  def index
    @workouts = Workout.all
  end

  # GET /workouts/1 or /workouts/1.json
  def show
    @block = @workout.blocks.new
  end

  # GET /workouts/new
  def new
    weekday = Workout::WEEKDAY[Time.new().wday()]
    @workout = Workout.new(name: "Happy #{weekday} workout!")
    @workout.save
    respond_to do |format|
      if @workout.save
        format.html { redirect_to workout_url(@workout), notice: "Workout was successfully created." }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # POST /workouts or /workouts.json
  def create
    @workout = Workout.new(workout_params)
    
    respond_to do |format|
      if @workout.save
        format.html { redirect_to workout_url(@workout), notice: "workout was successfully created." }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /workouts/1/edit
  def edit
    # authorize @workout
    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: turbo_stream.update(
          @workout,
          partial: "workouts/form",
          locals: {workout: @workout}) 
      end
    end
  end

  # PATCH/PUT /workouts/1 or /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.turbo_stream do 
          render turbo_stream: [
            turbo_stream.update(
              @workout,
              partial: "workouts/workout",
              locals: {workout: @workout}),
            turbo_stream.update('notice', "workout #{@workout.id} updated")
          ]
        end
      else
        format.turbo_stream do 
          render turbo_stream: turbo_stream.update(
            @workout,
            partial: "workouts/form",
            locals: {workout: @workout}) 
        end   
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @workout.update(workout_params)
  #       format.html { redirect_to workout_url(@workout), notice: "workout was successfully updated." }
  #       format.json { render :show, status: :ok, location: @workout }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @workout.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /workouts/1 or /workouts/1.json
  def destroy
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url, notice: "workout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:name, :description, blocks_attributes: [:id])
    end
end