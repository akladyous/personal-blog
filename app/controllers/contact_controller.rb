class ContactController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_contact, only: :new
  def index
    @constrains = {
      name: { presence: { allowEmpty: false, message: "^Name name can't be blank" } },
      email: { presence: { allowEmpty: false, message: "^Email name can't be blank" },
               email: { message: 'Please enter a valid email' } },
      subject: { presence: { allowEmpty: false, message: "^Subject name can't be blank" } },
      message: { presence: { allowEmpty: false, message: "^Message name can't be blank" } }
    }
  end

  def create
    @contact = contact.params.to_h
  end

  private
  def contact_params
    params.permit(:name, :email, :subject, :message)
  end

  def set_contact
    @contact = Contact.new
  end
end
