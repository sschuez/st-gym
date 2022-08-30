module Blocks
  class ActionsController < ApplicationController
    skip_before_action :authenticate_user!
    
    def edit_block
      @workout = Workout.find(params[:workout_id])
      @block = Block.find(params[:block_id])
      skip_authorization
    end
  end
end