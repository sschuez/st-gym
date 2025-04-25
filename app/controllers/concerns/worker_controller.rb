class WorkerController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def start_clearing_lonely_workouts
    ClearLonelyWorkoutsJob.perform_later
    head :ok
    logger.debug "🔥 Cleared all lonley workouts older than 24h"
  end
end
