# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
President::Application.initialize!
President::Application.configure do

config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings = {
   address:             "smtp.gmail.com",
   port:                 587,
   domain:              "the-presidents.herokuapp.com",
   authentication:      "plain",
   user_name:           "orinemia@gmail.com",
   password:            "Vardy@2016!",
   enable_starttls_auto: true
}
end