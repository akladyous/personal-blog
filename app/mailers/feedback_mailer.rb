class FeedbackMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.feedback_mailer.send_feedback.subject
  #
  def send_feedback(contact)
    @contact = contact
    mail to: @contact.email, subject: @contact.subject
  end
end
