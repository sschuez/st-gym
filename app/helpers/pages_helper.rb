module PagesHelper
  def application_container
    excluded_controllers = %w[posts]
    excluded_actions = %w[index show]

    unless excluded_controllers.include?(controller.controller_name) && excluded_actions.include?(controller.action_name)
      "container"
    end
  end

  def narrow_application_container
    excluded_controllers = %w[pages posts]

    return if excluded_controllers.include?(controller.controller_name)

    "narrow-container"
  end
end
