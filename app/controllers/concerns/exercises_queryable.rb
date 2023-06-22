module ExercisesQueryable 
  extend ActiveSupport::Concern

  private
  
  def determine_category_exercises(params)
    main_category_is_not_set_to_all = params[:main_category].to_i != 0 || params[:main_category] != "reset_main_category_list"
    category_is_not_set_to_all = params[:category].to_i != 0 || params[:category] != "reset_category_list"

    main_category_query = params[:main_category].present? && main_category_is_not_set_to_all
    category_query = params[:category].present? && category_is_not_set_to_all
      
    if main_category_query && category_query
      exercises_array = Exercise.by_main_and_other_category(params[:main_category].to_i, params[:category].to_i)
      
      return exercises = Exercise.where(id: exercises_array.map(&:id)).ordered
    elsif main_category_query && !category_query
      return exercises = Exercise.by_main_category(params[:main_category].to_i).ordered
    elsif params[:main_category] == "reset_main_category_list" && category_query
      return exercises = Exercise.by_category(params[:category].to_i).ordered
    else
      return exercises = Exercise.ordered
    end
  end
  
  def query_and_respond(exercises)
    if params[:query].present? && params[:query].to_i == 0
      # sql_query = "name ILIKE :query OR description ILIKE :query"
      sql_query = "name ILIKE :query"
      @exercises = exercises.where(sql_query, query: "%#{params[:query]}%")
    end
    
    respond_to do |format|
      format.html
      # format.text { render partial: "list", locals: { exercises: exercises }, formats: :html }
      format.turbo_stream
    end
  end

end