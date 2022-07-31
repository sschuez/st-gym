class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :show, :edit, :update ]
  before_action :set_session, only: %i[ show edit update destroy ]
  
  # GET /sessions or /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1 or /sessions/1.json
  def show
    @block = @session.blocks.build
  end

  # GET /sessions/new
  def new
    @session = Session.new(name: "Your session on #{Time.now.strftime("%d.%m.%Y at %H:%M")}")
    @session.save
    respond_to do |format|
      if @session.save
        format.html { redirect_to session_url(@session), notice: "Session was successfully created." }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # POST /sessions or /sessions.json
  def create
    @session = Session.new(session_params)
    
    respond_to do |format|
      if @session.save
        format.html { redirect_to session_url(@session), notice: "Session was successfully created." }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /sessions/1/edit
  def edit
    # authorize @session
    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: turbo_stream.update(
          @session,
          partial: "sessions/form",
          locals: {session: @session}) 
      end
    end
  end

  # PATCH/PUT /sessions/1 or /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.turbo_stream do 
          render turbo_stream: [
            turbo_stream.update(
              @session,
              partial: "sessions/session",
              locals: {session: @session}),
            turbo_stream.update('notice', "session #{@session.id} updated")
          ]
        end
      else
        format.turbo_stream do 
          render turbo_stream: turbo_stream.update(
            @session,
            partial: "sessions/form",
            locals: {session: @session}) 
        end   
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @session.update(session_params)
  #       format.html { redirect_to session_url(@session), notice: "Session was successfully updated." }
  #       format.json { render :show, status: :ok, location: @session }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @session.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /sessions/1 or /sessions/1.json
  def destroy
    @session.destroy

    respond_to do |format|
      format.html { redirect_to sessions_url, notice: "Session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:session).permit(:name, :description, blocks_attributes: [:id])
    end
end
