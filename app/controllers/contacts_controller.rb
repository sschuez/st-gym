class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :set_contact, only: %i[show destroy]

  def index
    @pagy, @contacts = pagy(policy_scope(Contact))
  end

  def show; end

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact

    if @contact.save
      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "Your feedback has been sent." }
      end
    else
      render :new
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path, status: :see_other, allow_other_host: true
  end

  private

  def contact_params
    params.expect(contact: %i[email content])
  end

  def set_contact
    @contact = Contact.find(params[:id])
    authorize @contact
  end
end
