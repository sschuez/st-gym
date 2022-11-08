class WorkoutIndexCardPresenter
  include ActionView::Context
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::UrlHelper
  include Rails.application.routes.url_helpers
  
  def self.call(workout, view_context)
    new(workout, view_context).call
  end

  attr_accessor :workout, :view_context

  def initialize(workout, view_context)
    @workout, @view_context = workout, view_context
  end

  def call
    card  
  end

  private

  def card
    content_tag :div, id: "workout_#{workout.id}", class: "card workout-index-card" do
      # view_context.link_to workout_url(workout) do
      # Rails.application.routes.url_helpers.workout_path(workout) do
      # link = link_to(Rails.application.routes.url_helpers.workout_path(workout))
      # content_tag :a, link do
        workout_card
      # end
      # card_controls      
    end
  end

  def workout_card
    # turbo_stream_from workout
    content_tag :div, class: "card-header bg-transparent small" do
      card_title +
      workout_description +
      workout_status
    end
  end

  def card_title
    content_tag :h1, workout.name
  end

  def workout_description
    content_tag :span, "#{workout.description} (#{workout_blocks})"
  end

  def workout_status
    workout_st = workout.public ? "Public workout" : "Private workout"
    content_tag :p, workout_st, class: "text-secondary small grey my-1"
  end

  def workout_blocks
    ActionController::Base.helpers.pluralize(workout.blocks.count, 'block') 
    # pluralize workout.blocks.count, "block"
  end

end