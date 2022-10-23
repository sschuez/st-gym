class Admin::AnalyticsController < ApplicationController

  def index
    @visits = Ahoy::Visit.includes(:events).order(started_at: :desc).all
  end

end