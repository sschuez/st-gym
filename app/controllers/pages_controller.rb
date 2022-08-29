class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
  end

  def home_modal
    skip_authorization
  end

  def about
  end
end
