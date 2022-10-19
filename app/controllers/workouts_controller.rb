class WorkoutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :public_workouts, :new, :show, :edit, :update ]
  before_action :set_workout, only: %i[ show edit update destroy ]

  # GET /workouts or /workouts.json
  def index
    @workouts = policy_scope(Workout).order(created_at: :desc)
  end

  def user_workouts
    skip_authorization
    if params[:user] && current_user.admin?
      user = User.find(params[:user])
      @header = user.email
      @workouts = Workout.where(user: user).order(updated_at: :desc)
    else
      @workouts = Workout.where(user: current_user).order(updated_at: :desc)
    end
  end

  def public_workouts
    skip_authorization
    @workouts = Workout.published.order(updated_at: :desc)
  end

  # GET /workouts/1 or /workouts/1.json
  def show
    @block = @workout.blocks.new
  end

  # GET /workouts/new
  def new
    @workout = Workout.new(
      name: "Workout ##{user_signed_in? ? current_user.workouts.count + 1 : Workout.count}",
      description: "Workout on #{Time.now.strftime("%A, %B %e, %Y")
    }")
    @workout.user = current_user if user_signed_in? 
    authorize @workout
    
    respond_to do |format|
      if @workout.save
        # Create 1 block, with random exercise
        block = @workout.blocks.create(title: "Block #1")
        block.exercise_instances.create(exercise: Exercise.find(Exercise.pluck(:id).sample))

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
    authorize @workout
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

  def save_workout
    @workout_to_save = Workout.find(params[:id])
    authorize @workout_to_save
    
    saved_workout = helpers.save_workout_for(current_user, @workout_to_save.id)
    flash[:notice] = "Workout (#{saved_workout.name}) was saved to your profile"
    redirect_to workout_path(saved_workout)
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
