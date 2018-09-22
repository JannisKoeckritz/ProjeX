# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings ={
# 	:address => 'smtp.gmail.com',
# 	:port => 587,
# 	:user_name => ENV['MAIL_USERNAME'],
# 	:password => ENV['MAIL_PASSWORD'],
# 	:domain => 'localhost:3000',
# 	:enable_starttls_auto => true
# }
