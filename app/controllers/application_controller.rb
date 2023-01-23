class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include DeviseRedirect
  include Pagy::Backend
  
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!
  # after_action :track_action
  # before_action :set_current_user, if: :user_signed_in?
  


  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  # def set_current_user
  #   Current.user = current_user
  # end
  
  protected

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end
end
