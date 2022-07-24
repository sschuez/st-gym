class SessionInstancesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_session

  def new
    @session_instance = @session.session_instance.new
    # @block.session = @session
  end
  
  def create
    @parent = parent
    @session_instance = @parent.session_instances.new(session_instance_params)
    @session_instance.session = @session
    respond_to do |format|
      if @session_instance.save
        # @session_instance.broadcast_prepend_later_to @session_instance.session
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            "session_instances",
            partial: "session_instances/session_instance",
            locals: { session_instance: @session_instance })
        end
        format.html { redirect_to @session_instance, notice: "session_instance was successfully created." }
        format.json { render :show, status: :created, location: @session_instance }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            'new_session_instance',
            partial: "session_instances/form",
            locals: {session_instance: @session_instance})
        end
      end
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @session_instance.errors, status: :unprocessable_entity }
    end
  end
  
  private

  def session_instance_params
    params.require(:session_instance).permit(:session_id, :exercise_instance_id, :block_id)
  end

  def parent
    return Block.find params[:block_id] if params[:block_id]
    ExerciseInstance.find params[:exercise_instance_id] if params[:exercise_instance_id]
  end

  def set_session
    @session = Session.find(params[:session_id])
  end
end
