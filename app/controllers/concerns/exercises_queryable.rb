module ExercisesQueryable 
  extend ActiveSupport::Concern

  private
  
  def determine_category_exercises(params)
    main_category_query = params[:main_category].present? && (params[:main_category].to_i != 0 || params[:main_category] != "reset_main_category_list")
    category_query = params[:category].present? && (params[:category].to_i != 0 || params[:category] != "reset_category_list")
      
    if main_category_query && category_query
      main_category_exercises = Exercise.joins(:exercise_categories).where(exercise_categories: { category_id: params[:main_category].to_i }).ordered
      category_exercises = Exercise.joins(:exercise_categories).where(exercise_categories: { category_id: params[:category].to_i }).ordered
      exercises_array = main_category_exercises & category_exercises
      return exercises = Exercise.where(id: exercises_array.map(&:id))
    elsif main_category_query && !category_query
      return exercises = Exercise.joins(:exercise_categories).where(exercise_categories: { category_id: params[:main_category].to_i }).ordered
    elsif params[:main_category] == "reset_main_category_list" && category_query
      return exercises = Exercise.joins(:exercise_categories).where(exercise_categories: { category_id: params[:category].to_i }).ordered  
    else
      return exercises = Exercise.ordered
    end
  end
  
  def query_and_respond(exercises)
    if params[:query].present? && params[:query].to_i == 0
      # sql_query = "name ILIKE :query OR description ILIKE :query"
      sql_query = "name ILIKE :query"
      exercises = exercises.where(sql_query, query: "%#{params[:query]}%")
    end
    
    respond_to do |format|
      format.html
      format.text { render partial: "list", locals: { exercises: exercises }, formats: :html }
      format.turbo_stream
    end
  end

end