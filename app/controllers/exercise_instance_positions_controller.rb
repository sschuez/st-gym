class ExerciseInstancePositionsController < ApplicationController
  skip_before_action :authenticate_user!

  def update
    @exercise_instance = GlobalID::Locator.locate_signed(params[:sgid])
    authorize @exercise_instance
    @exercise_instance.insert_at(params[:position])
    head :ok
  end
end