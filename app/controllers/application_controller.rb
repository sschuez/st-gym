class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  
  before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token
  # after_action :track_action
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private
  
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    
    if request.referrer
      redirect_to(request.referrer)
    else 
      redirect_to(root_path)
    end
  end
  
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  protected

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end
end
