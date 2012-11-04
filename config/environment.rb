# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Fixit::Application.initialize!


#config.action_mailer.delivery_method = :smtp
#config.action_mailer.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
:address => "smtp.gmail.com",
:port => 587,
:authentication => :plain,
:domain => ENV['GMAIL_USERNAME'] #"ucbfixit@gmail.com",
:user_name => ENV['GMAIL_USERNAME'] #"ucbfixit@gmail.com",
:password => ENV['GMAIL_PASSWORD']
}


