class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!#, only: [ :new, :show ]

  # GET /exercises or /exercises.json
  def index
    @exercises = policy_scope(Exercise).includes(:categories).ordered
  end

  # GET /exercises/1 or /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
    authorize @exercise
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises or /exercises.json
  def create
    @exercise = Exercise.new(exercise_params.reject { |k,v| k == "exercise_categories" })
    authorize @exercise

    categories = Category.where(id: params[:exercise][:exercise_categories])
    exercise_categories = []
    categories.each do |category|
      exercise_category = ExerciseCategory.new(category: category)
      exercise_categories << exercise_category
    end

    has_one_main_category = exercise_categories.select { |exercise_category| exercise_category.category.main_category }.count == 1

    if has_one_main_category
      if @exercise.save
        redirect_to request.referrer, notice: "#{@exercise.name} was created. You can now choose and add it to a block."
        exercise_categories.each { |exercise_category| exercise_category.update(exercise: @exercise) }
      else
        render :new, status: :unprocessable_entity
      end
    else
      @exercise.errors.add(:categories, "must have one main category")
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    if @exercise.update(exercise_params)
      redirect_to request.referrer, notice: "Exercise was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /exercises/1 or /exercises/1.json
  def destroy
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
      authorize @exercise
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.require(:exercise).permit(:name, :description, exercise_categories: [], files: [])
    end
end
