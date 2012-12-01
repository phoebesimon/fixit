class UserMailer < ActionMailer::Base
  default :from => ENV['GMAIL_USERNAME']

  def request_created_email(email_body, subject_text)
    @email_body = email_body
    mail(:to => ENV['GMAIL_DEST'], :subject => subject_text)
  end

  def request_view_status_email(email_body, subject_text)
    @email_body = email_body
    mail(:to => ENV['GMAIL_DEST'], :subject => subject_text)
  end
end
