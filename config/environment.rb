# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings ={
	:adress => 'smtp.gmail.com',
	:port => 587,
	:user_name => ENV['MAIL_USERNAME'],
	:password => ENV['MAIL_PASSWORD'],
	:domain => 'gmail.com',
	:enable_starttls_auto => true
}

# :user_name => ENV['SENDGRID_USERNAME'],
# 	:password => ENV['SENDGRID_PASSWORD']