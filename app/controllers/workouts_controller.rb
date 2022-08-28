class WorkoutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :show, :edit, :update ]
  before_action :set_workout, only: %i[ show edit update destroy ]

  # GET /workouts or /workouts.json
  def index
    @workouts = policy_scope(Workout).order(created_at: :desc)
    # @workouts = Workout.all.order(created_at: :desc)
    # @public_workouts = Workout.all.published.order(created_at: :desc)
    # authorize @workouts
  end

  # GET /workouts/1 or /workouts/1.json
  def show
    @block = @workout.blocks.new
  end

  # GET /workouts/new
  def new
    weekday = Workout::WEEKDAY[Time.new().wday()]
    @workout = Workout.new(name: "Happy #{weekday} workout!")
    @workout.user = current_user if user_signed_in? 
    authorize @workout
    @workout.save
    
    respond_to do |format|
      if @workout.save
        format.html { redirect_to workout_path(@workout), notice: "Workout was successfully created." }
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
        format.html { redirect_to workout_path(@workout), notice: "workout was successfully created." }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /workouts/1/edit
  def edit
    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: turbo_stream.update(
          "workout_#{@workout.id}_header",
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
  
  # DELETE /workouts/1 or /workouts/1.json
  def destroy
    @workout.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@workout) }
      format.html { redirect_to workouts_path, notice: "Workout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_public
    @workout = Workout.find(params[:id])
    authorize @workout, :create? 
    respond_to do |format|
      if @workout.toggle! :public
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
      authorize @workout
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:name, :description, blocks_attributes: [:id])
    end
end
