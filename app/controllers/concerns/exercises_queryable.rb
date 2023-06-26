module ExercisesQueryable 
  extend ActiveSupport::Concern

  private
  
  def get_user_exercises(params)
    if params[:user_category].present? && params[:user_category] != "reset_user_category_list"
      exercises = Exercise.by_user(params[:user_category].to_i)
    else
      exercises = Exercise.all
    end
  end

  def determine_main_and_user_categories(params)
    {
      user_category_filter_changed: params[:user_category_filter_changed] == "true",
      main_category_filter_changed: params[:main_category_filter_changed] == "true",
      user_category: params[:user_category],
      main_category: params[:main_category]
    }
  end

  def determine_category_exercises(user_exercises, params)
    main_category_is_not_set_to_all = params[:main_category].to_i != 0 || params[:main_category] != "reset_main_category_list"
    category_is_not_set_to_all = params[:category].to_i != 0 || params[:category] != "reset_category_list"

    main_category_query = params[:main_category].present? && main_category_is_not_set_to_all
    category_query = params[:category].present? && category_is_not_set_to_all
      
    if main_category_query && category_query
      exercises_array = user_exercises.by_main_and_other_category(params[:main_category].to_i, params[:category].to_i)
      
      return exercises = user_exercises.where(id: exercises_array.map(&:id)).ordered
    elsif main_category_query && !category_query
      return exercises = user_exercises.by_main_category(params[:main_category].to_i).ordered
    elsif params[:main_category] == "reset_main_category_list" && category_query
      return exercises = user_exercises.by_category(params[:category].to_i).ordered
    else
      return exercises = user_exercises.ordered
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