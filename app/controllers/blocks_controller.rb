class BlocksController < ApplicationController
  skip_before_action :authenticate_user!#, only: [ :new, :show ]
  before_action :set_workout, only: %i[ new create edit update destroy ]
  before_action :set_block, only: %i[ edit edit_title update destroy ]

  # GET /blocks/new
  def new
    @block = @workout.blocks.new
    @block.workout = @workout
  end

  # GET /blocks/1/edit
  def edit
    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: turbo_stream.update(
          @block,
          partial: "blocks/title_form",
          locals: {block: @block}) 
      end
    end
  end

  def edit_title
    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: turbo_stream.update(
          "block_#{@block.id}_title",
          partial: "blocks/title_form",
          locals: {block: @block}) 
      end
    end
  end

  # POST /blocks or /blocks.json
  def create
    @block = @workout.blocks.new(block_params)
    @block.workout = @workout
    next_block_nr = @workout.blocks.count + 1
    @block.title = "Block #{next_block_nr}"
    
    respond_to do |format|
      if @block.save
        # @block.broadcast_prepend_later_to @block.workout
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            "blocks",
            partial: "blocks/block",
            locals: { block: @block })
        end
        format.html { redirect_to @block, notice: "Block was successfully created." }
        format.json { render :show, status: :created, location: @block }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            'new_block',
            partial: "blocks/form",
            locals: {block: @block})
        end
      end
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @block.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /blocks/1 or /blocks/1.json
  def update
    @block.workout = @block.workout
    respond_to do |format|
      if @block.update(block_params)
        
        format.turbo_stream do 
          render turbo_stream: [
            turbo_stream.update(
              "block_#{@block.id}_title",
              partial: "blocks/block_header_title",
              locals: {block: @block})
          ]
        end
        
      else
        format.turbo_stream do 
          render turbo_stream: turbo_stream.update(
            "block_#{@block.id}_title",
            partial: "blocks/title_form",
            locals: {block: @block}) 
        end   
      end
    end
  end

  # DELETE /blocks/1 or /blocks/1.json
  def destroy
    @block.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@block) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    def set_workout
      @workout = Workout.find(params[:workout_id])
    end

    # Only allow a list of trusted parameters through.
    def block_params
      params.require(:block).permit(:workout_id, :title, :repetitions, :time)
    end
end
