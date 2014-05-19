class ContactNotifier < ActionMailer::Base
  default from: 'webmaster@the-presidents.herokuapp.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_notifier.message.subject
  #
  def message_email(believer)
    @believer = believer
    email_with_name = "#{@believer.firstname} <#{@believer.email}>"
    @url  = 'http://the-presidents.herokuapp.com/login'
    mail(to: email_with_name, subject: 'Welcome to the App!')
  end
end
