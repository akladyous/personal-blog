class ContactController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
    if @contact.valid?
      FeedbackMailer.send_feedback(@contact).deliver_now
      redirect_to root_path
    else
      render :index, contact: @contact
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
