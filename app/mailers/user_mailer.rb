class UserMailer < ActionMailer::Base
  default from: "from@example.com"
end


class UserMailer < ActionMailer::Base
  default :from => "ucbfixit@gmail.com"

  def request_created_email(email_body, subject_text)
    @email_body = email_body
    mail(:to => "christopher.j.turney@gmail.com", :subject => subject_text)
  end
end
