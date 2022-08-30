module Blocks
  class ActionsController < ApplicationController
    skip_before_action :authenticate_user!
    
    def edit_title
      @workout = Workout.find(params[:workout_id])
      @block = Block.find(params[:block_id])
      skip_authorization
    end

    def edit_quantity
      @workout = Workout.find(params[:workout_id])
      @block = Block.find(params[:block_id])
      skip_authorization
    end

    def edit_time
      @workout = Workout.find(params[:workout_id])
      @block = Block.find(params[:block_id])
      skip_authorization
    end

    def edit_repetitions
      @workout = Workout.find(params[:workout_id])
      @block = Block.find(params[:block_id])
      skip_authorization
    end
  end
end