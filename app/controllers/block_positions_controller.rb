class BlockPositionsController < ApplicationController
  skip_before_action :authenticate_user!

  def update
    @block = GlobalID::Locator.locate_signed(params[:sgid])
    @block.insert_at(params[:position])
    head :ok
  end
end