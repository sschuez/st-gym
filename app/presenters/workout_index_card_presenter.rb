class WorkoutIndexCardPresenter
  include ActionView::Context
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::UrlHelper
  include ApplicationHelper

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
      link_to(view_context.workout_url(workout)) do
        card_content
      end +
      card_controls   
    end
  end

  def card_content
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
    content_tag :p, "⏱️ #{formatted_duration(workout.time_it_takes)} - #{workout_st}", class: "text-secondary small grey my-1"
  end

  def card_controls
    return unless current_user_admin_or_user?

    content_tag :div, class: "workout-edit meta", data: { "meta-target": "user" } do
      delete_button
    end
  end

  def current_user_admin_or_user?
    view_context.current_user && 
      (view_context.current_user == workout.user || view_context.current_user&.admin?)
  end

  def delete_button
    button_to(view_context.workout_url(workout),
      method: :delete,
      form: { data: { turbo_confirm: "Are you sure you want to delete this workout?" } },
      class: "btn-styling") do 
        content_tag :span, "🗑️", class: "emoji"
      end
  end

  def workout_blocks
    ActionController::Base.helpers.pluralize(workout.blocks.count, 'block')
  end

end