module ExercisesQueryable
  extend ActiveSupport::Concern

  private

  def return_main_and_user_categories_as_instance_variables(params)
    determine_main_and_user_categories(params).each { |key, value| instance_variable_set("@#{key}", value) }
  end

  def determine_main_and_user_categories(params)
    {
      user_category_filter_changed: params[:user_category_filter_changed] == "true",
      main_category_filter_changed: params[:main_category_filter_changed] == "true",
      user_category: params[:user_category],
      main_category: params[:main_category]
    }
  end

  def determine_if_user_category_filter_present(params)
    if params[:user_category].present? && params[:user_category] != "reset_user_category_list"
      Exercise.by_user(params[:user_category].to_i).ordered
    else
      Exercise.ordered
    end
  end

  def determine_category_exercises(user_exercises, params)
    main_category_is_not_set_to_all = params[:main_category].to_i != 0 || params[:main_category] != "reset_main_category_list"
    category_is_not_set_to_all = params[:category].to_i != 0 || params[:category] != "reset_category_list"

    main_category_query = params[:main_category].present? && main_category_is_not_set_to_all
    category_query = params[:category].present? && category_is_not_set_to_all

    if main_category_query && category_query
      exercises_array = user_exercises.by_main_and_other_category(params[:main_category].to_i, params[:category].to_i)

      user_exercises.where(id: exercises_array.map(&:id)).ordered
    elsif main_category_query && !category_query
      user_exercises.by_main_category(params[:main_category].to_i).ordered
    elsif params[:main_category] == "reset_main_category_list" && category_query
      user_exercises.by_category(params[:category].to_i).ordered
    else
      user_exercises.ordered
    end
  end

  def query_and_respond(exercises)
    if params[:query].present? && params[:query].to_i.zero?
      @exercises = exercises.where("LOWER(name) LIKE ?", "%#{params[:query].downcase}%")
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
