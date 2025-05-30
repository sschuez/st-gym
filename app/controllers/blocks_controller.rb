class BlocksController < ApplicationController
  skip_before_action :authenticate_user! # , only: [ :new, :show ]
  before_action :set_workout, only: %i[new create edit update destroy]
  before_action :set_block, only: %i[edit update destroy]

  def new
    @block = @workout.blocks.new
    authorize @block
  end

  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          @block,
          partial: "blocks/title_form",
          locals: { block: @block }
        )
      end
    end
  end

  def edit_title
    @block = Block.find(params[:id])
    authorize @block, :edit?
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          "block_#{@block.id}_title",
          partial: "blocks/title_form",
          locals: { block: @block }
        )
      end
    end
  end

  def create
    @block = @workout.blocks.new(block_params)
    authorize @block

    next_block_nr = @workout.blocks.count + 1
    @block.title = "Block ##{next_block_nr}"

    respond_to do |format|
      if @block.save
        # @block.broadcast_prepend_later_to @block.workout
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            "blocks",
            partial: "blocks/block",
            locals: { block: @block }
          )
        end
        format.html { redirect_to @block, notice: "Block was successfully created." }
        format.json { render :show, status: :created, location: @block }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            "new_block",
            partial: "blocks/form",
            locals: { block: @block }
          )
        end
      end
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @block.errors, status: :unprocessable_entity }
    end
  end

  def update
    @block.workout = @block.workout
    respond_to do |format|
      if @block.update(block_params)

        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update(
              "block_#{@block.id}_title",
              partial: "blocks/block_header_title",
              locals: { block: @block }
            )
          ]
        end

      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            "block_#{@block.id}_title",
            partial: "blocks/title_form",
            locals: { block: @block }
          )
        end
      end
    end
  end

  def destroy
    @block.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_block
    @block = Block.find(params[:id])
    authorize @block
  end

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  # Only allow a list of trusted parameters through.
  def block_params
    params.expect(block: %i[workout_id title repetitions time])
  end
end
