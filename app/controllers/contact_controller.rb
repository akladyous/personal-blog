class ContactController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @constrains = {
      name: { presence: { allowEmpty: false, message: "^Name name can't be blank" } },
      email: { presence: { allowEmpty: false, message: "^Email name can't be blank" },
               email: { message: 'Please enter a valid email' } },
      subject: { presence: { allowEmpty: false, message: "^Subject name can't be blank" } },
      message: { presence: { allowEmpty: false, message: "^Message name can't be blank" } }
    }
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
    if @contact.valid?
      puts 'ok'
    else
      puts 'ko'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
